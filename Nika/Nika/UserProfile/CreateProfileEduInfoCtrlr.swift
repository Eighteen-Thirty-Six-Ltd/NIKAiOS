//
//  CreateProfileEduInfoCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//   

import UIKit

class CreateProfileEduInfoCtrlr: UIViewController {
    
    @IBOutlet weak var qualificationTxtFld: UITextField!
    @IBOutlet weak var professionTxtFld: UITextField!
    @IBOutlet weak var jobTitleTxtFld: UITextField!
    @IBOutlet weak var companyTxtFld: UITextField!
    
    @IBOutlet weak var BTN_Next: UIButton!
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
        user[FUSER_QUALIFICATION] = qualificationTxtFld.text
        user[FUSER_PROFESSION] = professionTxtFld.text
        user[FUSER_JOB_TITLE] = professionTxtFld.text
        user[FUSER_COMPANY] = companyTxtFld.text
        
        user.saveInBackground { (error) in
            if error == nil {
                let createProfileStep2Nav = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileReligiousInfoCtrlr")
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
