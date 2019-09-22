//
//  NikaUser.swift
//  Nika
//
//  Created by Basavaraj on 22/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit
import Firebase

class NikaUser: NSObject {
    
    let ref: DatabaseReference?
    let key: String
    
    var emailID : String!
    var firstName : String!
    var lastName : String!
    var location : String!
    var dob : String
    var gender : String!
    var height : String!
    var maritalStatus : String!
    var qualification : String!
    var profession : String!
    var jobTitile : String!
    var company : String!
    var sect : String!
    var religious : String!
    var pray : String!
    var marry : String!
    var alcohol : String!
    var halal : String!
    var smoke : String!
    var language : String!
    var ethnicity : String!
    var ethnicCtry : String!
    var photoPaths : [String]!
    
    override init() {
        
        self.ref = nil
        self.key = ""
        
        self.emailID = ""
        self.firstName = ""
        self.lastName = ""
        self.location = ""
        self.dob = ""
        self.gender = ""
        self.height = ""
        self.maritalStatus = ""
        self.qualification = ""
        self.profession = ""
        self.jobTitile = ""
        self.company = ""
        self.sect = ""
        self.religious = ""
        self.pray = ""
        self.marry = ""
        self.alcohol = ""
        self.halal = ""
        self.smoke = ""
        self.language = ""
        self.ethnicity = ""
        self.ethnicCtry = ""
        self.photoPaths = [String]()
    }
    
//    init(phoneNumber: String, name: String, isBizOwnerOrRep: Bool, profilePhotoStoragePath: String, appID: String, key: String = "") {
//        self.ref = nil
//        self.key = key
//
//        self.phoneNumber = phoneNumber
//        self.name = name
//        self.isBizOwnerOrRep = isBizOwnerOrRep
//        self.profilePhotoStoragePath = profilePhotoStoragePath
//        self.profileCreationCompleted = false
//        self.appID = appID
//    }
    
    init?(snapshot: DataSnapshot) {
        
        if let value = snapshot.value as? [String: AnyObject] {
            
            self.ref = snapshot.ref
            self.key = snapshot.key
            
            if let firstNme = value["firstName"] as? String {
                self.firstName = firstNme
            }
            else
            {
                self.firstName = ""
            }
            
            if let name = value["lastName"] as? String {
                self.lastName = name
            }
            else
            {
                self.lastName = ""
            }
            
            if let loc = value["location"] as? String {
                self.location = loc
            }
            else
            {
                self.location = ""
            }
            
            if let date = value["dob"] as? String {
                self.dob = date
            }
            else
            {
                self.dob = ""
            }
            
            if let loc = value["location"] as? String {
                self.location = loc
            }
            else
            {
                self.location = ""
            }
            
            if let gndr = value["gender"] as? String {
                self.gender = gndr
            }
            else
            {
                self.gender = ""
            }
            
            if let hgt = value["height"] as? String {
                self.height = hgt
            }
            else
            {
                self.height = ""
            }
            
            if let ms = value["maritalStatus"] as? String {
                self.maritalStatus = ms
            }
            else
            {
                self.maritalStatus = ""
            }
            
            if let ql = value["qualification"] as? String {
                self.qualification = ql
            }
            else
            {
                self.qualification = ""
            }
            
            if let prof = value["profession"] as? String {
                self.profession = prof
            }
            else
            {
                self.profession = ""
            }
            
            if let jt = value["jobTitile"] as? String {
                self.jobTitile = jt
            }
            else
            {
                self.jobTitile = ""
            }
            
            if let cm = value["company"] as? String {
                self.company = cm
            }
            else
            {
                self.company = ""
            }
            
            if let sct = value["sect"] as? String {
                self.sect = sct
            }
            else
            {
                self.sect = ""
            }
            
            if let rlg = value["religious"] as? String {
                self.religious = rlg
            }
            else
            {
                self.religious = ""
            }
            
            if let pry = value["pray"] as? String {
                self.pray = pry
            }
            else
            {
                self.pray = ""
            }
            
            if let mry = value["marry"] as? String {
                self.marry = mry
            }
            else
            {
                self.marry = ""
            }
            
            if let alc = value["alcohol"] as? String {
                self.alcohol = alc
            }
            else
            {
                self.alcohol = ""
            }
            
            if let hl = value["halal"] as? String {
                self.halal = hl
            }
            else
            {
                self.halal = ""
            }
            
            if let smk = value["smoke"] as? String {
                self.smoke = smk
            }
            else
            {
                self.smoke = ""
            }
            
            if let lge = value["language"] as? String {
                self.language = lge
            }
            else
            {
                self.language = ""
            }
            
            if let ethn = value["ethnicity"] as? String {
                self.ethnicity = ethn
            }
            else
            {
                self.ethnicity = ""
            }
            
            if let ethnC = value["ethnicCtry"] as? String {
                self.ethnicCtry = ethnC
            }
            else
            {
                self.ethnicCtry = ""
            }
            
            if let paths = value["photoPaths"] as? [String] {
                self.photoPaths = paths
            }
            else
            {
                self.photoPaths = [String]()
            }
        }
        else
        {
            return nil
        }
    }
    
    func toDictionary() -> [AnyHashable:Any] {
                        
        return [
            "firstName": self.firstName,
            "lastName": self.lastName,
            "location": self.location,
            "dob": self.dob,
            "gender": self.gender,
            "height": self.height,
            "maritalStatus": self.maritalStatus,
            "qualification": self.qualification,
            "profession": self.profession,
            "jobTitile": self.jobTitile,
            "company": self.company,
            "sect": self.sect,
            "religious": self.religious,
            "pray": self.pray,
            "marry": self.marry,
            "alcohol": self.alcohol,
            "halal": self.halal,
            "language": self.language,
            "smoke": self.smoke,
            "ethnicity": self.ethnicity,
            "ethnicCtry": self.ethnicCtry,
            "photoPaths": self.photoPaths
            ] as [AnyHashable:Any]
    }
    
}
