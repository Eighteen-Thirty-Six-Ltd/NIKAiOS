//
//  NikaDataManager.swift
//  Nika
//
//  Created by Basavaraj on 22/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaDataManager: NSObject {

    static let sharedDataManager: NikaDataManager = {
        let instance = NikaDataManager()
        // setup code
        return instance
    }()
    
    var userProf: NikaUser = NikaUser()
}
