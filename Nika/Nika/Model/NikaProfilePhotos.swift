//
//  NikaProfilePhotos.swift
//  Nika
//
//  Created by Basavaraj on 22/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit
import Firebase

class NikaProfilePhotos: NSObject {

//    let ref: DatabaseReference?
//    let key: String
    
    var mainPic : String!
    var pic1 : String!
    var pic2 : String!
    var pic3 : String!
    
    override init() {
        
//        self.ref = nil
//        self.key = ""
        
        self.mainPic = ""
        self.pic1 = ""
        self.pic2 = ""
        self.pic3 = ""
    }
    
    init?(snapshot: DataSnapshot) {
        
        if let value = snapshot.value as? [String: AnyObject] {
            
//            self.ref = snapshot.ref
//            self.key = snapshot.key
            
            if let mnPic = value["mainPic"] as? String {
                self.mainPic = mnPic
            }
            else
            {
                self.mainPic = ""
            }
            
            if let p1 = value["pic1"] as? String {
                self.pic1 = p1
            }
            else
            {
                self.pic1 = ""
            }
            
            if let p2 = value["pic2"] as? String {
                self.pic2 = p2
            }
            else
            {
                self.pic2 = ""
            }
            
            if let p3 = value["pic3"] as? String {
                self.pic3 = p3
            }
            else
            {
                self.pic3 = ""
            }
        }
    }
    
    init?(fromDicvalue: [String: AnyObject]) {
        
        if let mnPic = fromDicvalue["mainPic"] as? String {
            self.mainPic = mnPic
        }
        else
        {
            self.mainPic = ""
        }
        
        if let p1 = fromDicvalue["pic1"] as? String {
            self.pic1 = p1
        }
        else
        {
            self.pic1 = ""
        }
        
        if let p2 = fromDicvalue["pic2"] as? String {
            self.pic2 = p2
        }
        else
        {
            self.pic2 = ""
        }
        
        if let p3 = fromDicvalue["pic3"] as? String {
            self.pic3 = p3
        }
        else
        {
            self.pic3 = ""
        }
    }
    
    func toDictionary() -> [AnyHashable:Any] {
        
        return [
            "mainPic": self.mainPic,
            "pic1": self.pic1,
            "pic2": self.pic2,
            "pic3": self.pic3,
            ] as [AnyHashable:Any]
    }
}
