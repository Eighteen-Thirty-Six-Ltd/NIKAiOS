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
    
    
    var databaseRef: DatabaseReference = Database.database().reference(withPath: "nikamatch")
 
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
        { (isUploaded, error) in
            
            if(isUploaded)
            {
                NikaFirebaseStorageManager.sharedManager.imgStorageRef.downloadURL(completion: { (url, error) in
                    
                    if let imageURL = url {
                        
                        
                        userProfile.photoPaths.append(imageURL.absoluteString)
                        
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
}
