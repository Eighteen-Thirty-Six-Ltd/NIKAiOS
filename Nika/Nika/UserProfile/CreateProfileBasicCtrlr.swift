//
//  CreateProfileBasicCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class CreateProfileBasicCtrlr: UIViewController {

    @IBOutlet weak var BTN_Next: UIButton!
    
    @IBOutlet weak var LBL_Step1: UILabel!
    @IBOutlet weak var LBL_Header: UILabel!
    
    @IBOutlet weak var TEXT_FirstName: UITextField!
    @IBOutlet weak var TEXT_LastName: UITextField!
    @IBOutlet weak var TEXT_Location: UITextField!
    @IBOutlet weak var TEXT_dob: UITextField!
    @IBOutlet weak var TEXT_Gender: UITextField!
    @IBOutlet weak var TEXT_Height: UITextField!
    @IBOutlet weak var TEXT_MaritalStatus: UITextField!
    
    
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
            LBL_Step1.isHidden = true
            
            LBL_Header.text = "Edit Profile"
            BTN_Next.setTitle("SUBMIT", for: .normal)
            
            TEXT_FirstName.text = NikaDataManager.sharedDataManager.userProf.firstName
            TEXT_LastName.text = NikaDataManager.sharedDataManager.userProf.lastName
            TEXT_Location.text = NikaDataManager.sharedDataManager.userProf.location
            TEXT_dob.text = NikaDataManager.sharedDataManager.userProf.dob
            TEXT_Gender.text = NikaDataManager.sharedDataManager.userProf.gender
            TEXT_Height.text = NikaDataManager.sharedDataManager.userProf.height
            TEXT_MaritalStatus.text = NikaDataManager.sharedDataManager.userProf.maritalStatus
        }
        else
        {
            LBL_Header.text = "Create Profile"
            BTN_Next.setTitle("NEXT", for: .normal)
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    

    @IBAction func nextTapped(_ sender: UIButton) {
        
        if (TEXT_FirstName.text!.count > 0)
        {
            NikaDataManager.sharedDataManager.userProf.firstName = TEXT_FirstName.text
            NikaDataManager.sharedDataManager.userProf.lastName = TEXT_LastName.text
            NikaDataManager.sharedDataManager.userProf.location = TEXT_Location.text
            NikaDataManager.sharedDataManager.userProf.dob = TEXT_dob.text!
            NikaDataManager.sharedDataManager.userProf.gender = TEXT_Gender.text
            NikaDataManager.sharedDataManager.userProf.height = TEXT_Height.text
            NikaDataManager.sharedDataManager.userProf.maritalStatus = TEXT_MaritalStatus.text
            
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
                let baseNav : CreateProfileEduInfoCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileEduInfoCtrlr") as! CreateProfileEduInfoCtrlr
                
                self.navigationController?.pushViewController(baseNav, animated: true)
            }
        }
        else
        {
            let alert = UIAlertController(title: "Alert", message: "Please enter the first name", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
                switch action.style{
                case .default:
                    print("default")
                    
                case .cancel:
                    print("cancel")
                    
                case .destructive:
                    print("destructive")
                    
                    
                }}))
            self.present(alert, animated: true, completion: nil)
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
