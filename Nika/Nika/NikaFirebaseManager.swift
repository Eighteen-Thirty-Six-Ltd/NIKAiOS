//
//  NikaFirebaseManager.swift
//  Nika
//
//  Created by Basavaraj on 22/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit
import Firebase

class NikaFirebaseManager: NSObject {

    static let sharedManager: NikaFirebaseManager = {
        let instance = NikaFirebaseManager()
        // setup code
        return instance
    }()
    
    
    var databaseRef: DatabaseReference!
 
    func addUserProfile(userProfile : NikaUser)  {
        
        let userID : String = (Auth.auth().currentUser?.uid)!
        let itemRef = self.databaseRef.child("Users").child(userID)
        itemRef.setValue(userProfile.toDictionary())
    }
    
    func updateUserProfile(userProfile : NikaUser)  {
        
        let userID : String = (Auth.auth().currentUser?.uid)!
        let itemRef = self.databaseRef.child("Users").child(userID)
        itemRef.setValue(userProfile.toDictionary())
        itemRef.updateChildValues(userProfile.toDictionary())
    }
    
    func recoverExistingUserProfile(completion : ((_ user: NikaUser?) -> Void)?) -> Void {
        
        let userID : String = (Auth.auth().currentUser?.uid)!
        let itemRef = self.databaseRef.child("Users")
        
        itemRef.queryOrdered(byChild: userID).observeSingleEvent(of : .value, with: { snapshot in
            
            let userSnapshot = snapshot.childSnapshot(forPath: userID)
            
            if(userSnapshot.exists())
            {
                let userInfo = NikaUser(snapshot: userSnapshot)
                completion!(userInfo!)
            }
            else
            {
                completion!(nil)
            }
        })
    }
    
    func uploadImageAndStoreURL(imageIdentifier : String ,userProfile : NikaUser, image : UIImage) {
        
        NikaFirebaseStorageManager.sharedManager.uploadImageToFirebaseStorage(imageIdentifier: imageIdentifier, userInfo: userProfile, image: image)
        { (isUploaded, error, storReference) in
            
            if(isUploaded)
            {
                storReference.downloadURL(completion: { (url, error) in
                    
                    if let imageURL = url {
                        
                        if(imageIdentifier == "mainPict")
                        {
                            userProfile.photoPaths.mainPic = imageURL.absoluteString
                        }
                        else if(imageIdentifier == "pict1")
                        {
                            userProfile.photoPaths.pic1 = imageURL.absoluteString
                        }
                        else if(imageIdentifier == "pict2")
                        {
                            userProfile.photoPaths.pic2 = imageURL.absoluteString
                        }
                        else if(imageIdentifier == "pict3")
                        {
                            userProfile.photoPaths.pic3 = imageURL.absoluteString
                        }
//                        NotificationCenter.default.post(name: .profileImageUploadedNotification, object: self, userInfo: nil)
                        
                        let userID : String = (Auth.auth().currentUser?.uid)!
                        let itemRef = self.databaseRef.child("Users").child(userID)
                        itemRef.setValue(userProfile.toDictionary())
                        itemRef.updateChildValues(userProfile.toDictionary())
                        
                    }
                    
                })
            }
        }
        
    }
    
    func initializeReferences () {
        
        self.databaseRef = Database.database().reference(withPath: "nikamatch")
        NikaFirebaseStorageManager.sharedManager.imgStorageRef = Storage.storage().reference(withPath: "nikamatch")
    }
    
    func logOutFromFirebase() {
        
        do {
            try Auth.auth().signOut()
        } catch let signOutError as NSError {
            print ("Error signing out: %@", signOutError)
        }
        
        self.clearUserDefaults()
    }
    
    func clearUserDefaults() {
        
    }
}
