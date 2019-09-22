//
//  CreateProfileBasicCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit
import Firebase

class CreateProfileBasicCtrlr: UIViewController {

    @IBOutlet weak var BTN_Next: UIButton!
    
    @IBOutlet weak var firstNameTxtFld: UITextField!
    @IBOutlet weak var lastNameTxtFld: UITextField!
    @IBOutlet weak var locationTxtFld: UITextField!
    @IBOutlet weak var dobTxtFld: UITextField!
    @IBOutlet weak var genderTxtFld: UITextField!
    @IBOutlet weak var heightTxtFld: UITextField!
    @IBOutlet weak var maritalStatusTxtFld: UITextField!
    
    var isEditMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BTN_Next.addCornerRadius(cornerRadius: 10.0)
        BTN_Next.addShadow()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func nextTapped(_ sender: UIButton) {
        let user = FUser.currentUser()
        user[FUSER_FIRSTNAME] = firstNameTxtFld.text
        user[FUSER_LASTNAME] = lastNameTxtFld.text
        user[FUSER_LOCATION] = locationTxtFld.text
        user[FUSER_GENDER] = genderTxtFld.text
        user[FUSER_HEIGHT] = heightTxtFld.text
        user[FUSER_MARITAL_STATUS] = maritalStatusTxtFld.text
        
        user.saveInBackground { (error) in
            if error == nil {
                let createProfileStep2Nav = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileEduInfoCtrlr")
                self.present(createProfileStep2Nav!, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        
        if (isEditMode)
        {
            self.dismiss(animated: true, completion: nil)
        }
        else
        {
            self.navigationController?.dismiss(animated: true, completion: nil)
        }
    }
}
