//
//  CreateProfileEduInfoCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//   

import UIKit

class CreateProfileEduInfoCtrlr: UIViewController {

    @IBOutlet weak var LBL_Step2: UILabel!
    @IBOutlet weak var LBL_Header: UILabel!
    
    @IBOutlet weak var BTN_Next: UIButton!
    @IBOutlet weak var TEXT_Qualification: UITextField!
    @IBOutlet weak var TEXT_Profession: UITextField!
    @IBOutlet weak var TEXT_JobTitle: UITextField!
    @IBOutlet weak var TEXT_Company: UITextField!
    
    
    var isEditMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BTN_Next.addCornerRadius(cornerRadius: 10.0)
        BTN_Next.addShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if (self.isEditMode)
        {
            LBL_Header.text = "Edit Profile"
            LBL_Step2.isHidden = true
            
            BTN_Next.setTitle("SUBMIT", for: .normal)
            
            TEXT_Qualification.text = NikaDataManager.sharedDataManager.userProf.qualification
            TEXT_Profession.text = NikaDataManager.sharedDataManager.userProf.profession
            TEXT_JobTitle.text = NikaDataManager.sharedDataManager.userProf.jobTitile
            TEXT_Company.text = NikaDataManager.sharedDataManager.userProf.company
        }
        else
        {
            LBL_Header.text = "Create Profile"
            BTN_Next.setTitle("NEXT", for: .normal)
        }
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
        
        NikaDataManager.sharedDataManager.userProf.qualification = TEXT_Qualification.text
        NikaDataManager.sharedDataManager.userProf.profession = TEXT_Profession.text
        NikaDataManager.sharedDataManager.userProf.jobTitile = TEXT_JobTitle.text
        NikaDataManager.sharedDataManager.userProf.company = TEXT_Company.text!
        
        if (self.isEditMode)
        {
            NikaFirebaseManager.sharedManager.updateUserProfile(userProfile: NikaDataManager.sharedDataManager.userProf)
            
            let alert = UIAlertController(title: "Alert", message: "Successfully updated", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    self.dismiss(animated: true, completion: nil)
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
        }
        else
        {
            let baseNav : CreateProfileReligiousInfoCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileReligiousInfoCtrlr") as! CreateProfileReligiousInfoCtrlr
            
            
            
            self.navigationController?.pushViewController(baseNav, animated: true)
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
