//
//  ExploreController.swift
//  NikaMatch
//
//  Created by SUTTROOGUN Yogin Kumar on 18/09/19.
//  Copyright © 2019 Basavaraj. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import Firebase
import GoogleSignIn
import OneSignal

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate, SINServiceDelegate, SINCallClientDelegate {
    
    var window: UIWindow?
    //    var tabBarController: UITabBarController!
    
    var chatsView: ChatsView!
    var callsView: CallsView!
    var peopleView: PeopleView!
    var groupsView: GroupsView!
    var settingsView: SettingsView!
    
    @objc var sinchService: SINService?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //        Facebook
        FBSDKApplicationDelegate.sharedInstance()?.application(application, didFinishLaunchingWithOptions: launchOptions)
        
        //        Firebase
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = false
        
        //        let db = Firestore.firestore()
        //        let settings = db.settings
        //        settings.areTimestampsInSnapshotsEnabled = true
        //        db.settings = settings
        
        //        Google
        GIDSignIn.sharedInstance()?.clientID = FirebaseApp.app()?.options.clientID
        
        //        Crashlytics
        Fabric.with([Crashlytics.self])
        
        //        Dialogflow
        let configuration = AIDefaultConfiguration() as? AIConfiguration
        configuration?.clientAccessToken = DIALOGFLOW_ACCESS_TOKEN
        if let apiAI = ApiAI.shared() {
            apiAI.configuration = configuration
        }
        
        
        //        Push Notification
        let authorizationOptions: UNAuthorizationOptions = [.sound, .alert, .badge]
        let userNotificationCenter = UNUserNotificationCenter.current()
        userNotificationCenter.requestAuthorization(options: authorizationOptions, completionHandler: { granted, error in
            if (error == nil) {
                DispatchQueue.main.async {
                    UIApplication.shared.registerForRemoteNotifications()
                }
            }
        })
        
        //        OneSignal
        OneSignal.initWithLaunchOptions(launchOptions, appId: ONESIGNAL_APPID, handleNotificationReceived: nil, handleNotificationAction: nil, settings: [kOSSettingsKeyAutoPrompt: false])
        OneSignal.setLogLevel(ONE_S_LOG_LEVEL.LL_NONE, visualLevel: ONE_S_LOG_LEVEL.LL_NONE)
        
        
        //        This can be removed once Firebase auth issue is resolved
        if (UserDefaultsX.bool(key: "Initialized") == false) {
            UserDefaultsX.setObject(value: true, key: "Initialized")
            FUser.logOut()
        }
        
        //        Shortcut item
        Shortcut.create()
        
        //        Connection, Location initialization
        Connection.shared
        Location.shared
        
        //        RelayManager initialization
        RelayManager.shared
        
        //        Realm initialization
        Blockeds.shared
        Blockers.shared
        CallHistories.shared
        Friends.shared
        Groups.shared
        //        LinkedIds.shared
        //        LinkedUsers.shared
        Messages.shared
        Statuses.shared
        UserStatuses.shared
        
        //        UI initialization
        navigateToSignInOrUpStoryboard()
        
        //        Sinch initialization
        let config = SinchService.config(withApplicationKey: SINCH_KEY, applicationSecret: SINCH_SECRET, environmentHost: SINCH_HOST).pushNotifications(with: SINAPSEnvironment.development).disableMessaging()
        
        sinchService = SinchService.service(with: config)
        sinchService?.delegate = self
        sinchService?.callClient().delegate = self
        sinchService?.push().setDesiredPushType(SINPushTypeVoIP)
        
        NotificationCenterX.addObserver(target: self, selector: #selector(sinchLogInUser), name: NOTIFICATION_APP_STARTED)
        NotificationCenterX.addObserver(target: self, selector: #selector(sinchLogInUser), name: NOTIFICATION_USER_LOGGED_IN)
        NotificationCenterX.addObserver(target: self, selector: #selector(sinchLogOutUser), name: NOTIFICATION_USER_LOGGED_OUT)
        
        return true
    }
    
    func navigateToSignInOrUpStoryboard() {
        self.window = UIWindow(frame: UIScreen.main.bounds)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        
        let initialViewController = storyboard.instantiateViewController(withIdentifier: "ViewController")
        
        self.window?.rootViewController = initialViewController
    }
    
    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
        
        //        Facebook
        let handled = FBSDKApplicationDelegate.sharedInstance().application(app, open: url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        
        //        Google
        GIDSignIn.sharedInstance()?.handle(url, sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String, annotation: options[UIApplication.OpenURLOptionsKey.annotation])
        
        return handled
    }
    
    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
        
        Location.stop()
        UpdateLastTerminate(fetch: true)
    }
    
    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
        
        Location.start()
        UpdateLastActive()
        
        FBSDKAppEvents.activateApp()
        
        OneSignal.idsAvailable({ userId, pushToken in
            if (pushToken != nil) {
                UserDefaults.standard.set(userId, forKey: ONESIGNALID)
            } else {
                UserDefaults.standard.removeObject(forKey: ONESIGNALID)
            }
            UpdateOneSignalId()
        })
        
        CacheManager.cleanupExpired()
        
        NotificationCenterX.post(notification: NOTIFICATION_APP_STARTED)
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    // MARK: - CoreSpotlight methods
    
    func application(_ application: UIApplication, continue userActivity: NSUserActivity, restorationHandler: @escaping ([UIUserActivityRestoring]?) -> Void) -> Bool {
        
        if (userActivity.activityType == CSSearchableItemActionType) {
            let activityIdentifier = userActivity.userInfo?[CSSearchableItemActivityIdentifier] as! String
            print("AppDelegate continueUserActivity: \(activityIdentifier)")
            return true
        }
        return false
    }
    
    // MARK: - Sinch user methods
    
    @objc func sinchLogInUser() {
        
        if (FUser.currentId() != "") {
            sinchService?.logInUser(withId: FUser.currentId())
        }
    }
    
    //---------------------------------------------------------------------------------------------------------------------------------------------
    @objc func sinchLogOutUser() {
        
        sinchService?.logOutUser()
    }
    
    // MARK: - SINServiceDelegate
    
    func service(_ service: SINService?) throws {
        
    }
    
    // MARK: - SINCallClientDelegate
    
    func client(_ client: SINCallClient?, didReceiveIncomingCall call: SINCall?) {
        let topViewController = getTopMostController()
        
        if (call!.details.isVideoOffered) {
            let callVideoView = CallVideoView()
            callVideoView.myInit(call: call)
            topViewController?.present(callVideoView, animated: true)
        } else {
            let callAudioView = CallAudioView()
            callAudioView.myInit(call: call)
            topViewController?.present(callAudioView, animated: true)
        }
    }
    
    func getTopMostController() -> UIViewController? {
        guard let window = UIApplication.shared.keyWindow, let rootViewController = window.rootViewController else {
            return nil
        }
        
        var topController = rootViewController
        
        while let newTopController = topController.presentedViewController {
            topController = newTopController
        }
        
        return topController
    }
    
    func client(_ client: SINCallClient?, localNotificationForIncomingCall call: SINCall?) -> SINLocalNotification? {
        
        let notification = SINLocalNotification()
        notification.alertAction = "Answer"
        notification.alertBody = "Incoming call"
        notification.soundName = "call_incoming.wav"
        return notification
    }
    
    
    // MARK: - Push notification methods
    
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        
    }
    
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        
    }
    
    // MARK: - Home screen dynamic quick action methods
    
    func application(_ application: UIApplication, performActionFor shortcutItem: UIApplicationShortcutItem, completionHandler: @escaping (Bool) -> Void) {
        
        if (shortcutItem == nil) {
            return
        }
        
        if (shortcutItem.type == "newchat") {
            chatsView.actionNewChat()
        }
        
        if (shortcutItem.type == "newgroup") {
            groupsView.actionNewGroup()
        }
        
        if (shortcutItem.type == "recentuser") {
            let userInfo = shortcutItem.userInfo as! [String : String]
            let userId = userInfo["userId"] as! String
            chatsView.actionRecentUser(userId: userId)
        }
        
        if (shortcutItem.type == "shareapp") {
            var shareitems: [AnyHashable] = []
            shareitems.append(TEXT_SHARE_APP)
            let activityView = UIActivityViewController(activityItems: shareitems, applicationActivities: nil)
            let window: UIWindow? = UIApplication.shared.keyWindow
            window?.rootViewController?.present(activityView, animated: true)
        }
    }
}
