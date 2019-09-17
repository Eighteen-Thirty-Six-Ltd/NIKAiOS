//
//  NikaNotificationPermissionCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 12/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaNotificationPermissionCtrlr: UIViewController {

    @IBOutlet weak var BTN_Allow: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        BTN_Allow.addCornerRadius(cornerRadius: 10.0)
        BTN_Allow.addShadow()
    }
    

    
    @IBAction func btnAllowTapped(_ sender: UIButton) {
        
        let baseNav = self.storyboard?.instantiateViewController(withIdentifier: "NikaHomeCtrlr")
        self.present(baseNav!, animated: true, completion: nil)
    }
    
}
