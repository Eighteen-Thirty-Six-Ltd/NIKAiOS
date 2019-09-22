//
//  NikaFirebaseStorageManager.swift
//  Nika
//
//  Created by Basavaraj on 22/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit
import Firebase

class NikaFirebaseStorageManager: NSObject {

    static let sharedManager: NikaFirebaseStorageManager = {
        let instance = NikaFirebaseStorageManager()
        // setup code
        return instance
    }()
    
    var imgStorageRef: StorageReference = Storage.storage().reference(withPath: "nikamatch")
    
    func uploadImageToFirebaseStorage(imageIdentifier : String ,userInfo : NikaUser, image : UIImage, completion : ((_ uploadDone: Bool, _ error: Error?) -> Void)?) -> Void {
        
        let compressImageData = image.jpegData(compressionQuality: 0.5)
        
        self.imgStorageRef = self.imgStorageRef.child(userInfo.emailID).child(String(format: "%@.png", imageIdentifier))
        
        self.imgStorageRef.putData(compressImageData! as Data, metadata: nil) { (metadata, error) in
            
            if let handler = completion {
                
                if let anyError = error {
                    handler(false,anyError)
                }
                else
                {                    
                    handler(true,nil)
                }
            }
        }
    }
    
    func downloadImageFromFirebaseStorage(imageIdentifier : String ,userInfo : NikaUser, completion : ((_ image: UIImage?, _ error: Error?) -> Void)?) -> Void {
        
        self.imgStorageRef = self.imgStorageRef.child(userInfo.emailID).child(String(format: "%@.png", imageIdentifier))

        self.imgStorageRef.getData(maxSize: 1 * 1024 * 1024) { data, error in
            
            if let anyError = error {
                completion!(nil,anyError)                
            }
            else
            {
                let image = UIImage(data: data!)
                completion!(image,nil)
            }
        }
    }
    
    func deleteImageFromFirebaseStorage(imageIdentifier : String ,userInfo : NikaUser) -> Void {
        
        self.imgStorageRef = self.imgStorageRef.child(userInfo.emailID).child(String(format: "%@.png", imageIdentifier))

        self.imgStorageRef.delete { error in
            
            if let anyError = error {
                print(anyError)
            }
        }
    }
}
