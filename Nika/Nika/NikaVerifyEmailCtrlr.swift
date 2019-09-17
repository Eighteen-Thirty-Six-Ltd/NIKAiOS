//
//  NikaVerifyEmailCtrlr.swift
//  Nika
//
//  Created by Basavaraj  on 06/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaVerifyEmailCtrlr: UIViewController {

    @IBOutlet weak var TXTFIELD_One: UITextField!
    @IBOutlet weak var TXTFIELDTwo: UITextField!
    @IBOutlet weak var TXTFIELDThree: UITextField!
    @IBOutlet weak var TXTFIELDFour: UITextField!
    
    @IBOutlet weak var BTN_Confirm: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BTN_Confirm.addCornerRadius(cornerRadius: 10.0)
        BTN_Confirm.addShadow()
    }
    

    @IBAction func btnBackTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }

    @IBAction func btnConfirmTapped(_ sender: UIButton) {
        
        let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
        let baseNav = profileStoryboard.instantiateViewController(withIdentifier: "ProfileNavigationCtrlr")
        self.present(baseNav, animated: true, completion: nil)
        
    }
}
