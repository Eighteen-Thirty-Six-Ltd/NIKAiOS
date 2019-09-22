//
//  CreateProfileLanguageInfoCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class CreateProfileLanguageInfoCtrlr: UIViewController {

    @IBOutlet weak var BTN_Next: UIButton!
    var isEditMode = false
    
    @IBOutlet weak var languageTxtFld: UITextField!
    @IBOutlet weak var ethnicityTxtFld: UITextField!
    @IBOutlet weak var originTxtFld: UITextField!
    
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
        user[FUSER_LANGUAGE] = languageTxtFld.text
        user[FUSER_ETHNICITY] = ethnicityTxtFld.text
        user[FUSER_ORIGIN] = originTxtFld.text
        
        user.saveInBackground { (error) in
            if error == nil {
                let createProfileStep2Nav = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfilePhotosCtrlr")
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
            self.navigationController?.popViewController(animated: true)
        }
    }
}
