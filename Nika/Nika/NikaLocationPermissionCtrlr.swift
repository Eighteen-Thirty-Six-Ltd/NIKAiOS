//
//  NikaLocationPermissionCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 11/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaLocationPermissionCtrlr: UIViewController {

    @IBOutlet weak var BTN_Allow: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BTN_Allow.addCornerRadius(cornerRadius: 10.0)
        BTN_Allow.addShadow()
    }
    

    
    @IBAction func btnAllowTapped(_ sender: UIButton) {
        
        let baseNav = self.storyboard?.instantiateViewController(withIdentifier: "NikaNotificationPermissionCtrlr")
        self.present(baseNav!, animated: true, completion: nil)
    }
    
}
