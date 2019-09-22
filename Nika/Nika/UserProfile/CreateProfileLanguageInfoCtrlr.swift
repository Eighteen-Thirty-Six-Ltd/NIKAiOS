//
//  CreateProfileLanguageInfoCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class CreateProfileLanguageInfoCtrlr: UIViewController {

    @IBOutlet weak var LBL_Step4: UILabel!
    @IBOutlet weak var LBL_Header: UILabel!
    
    @IBOutlet weak var BTN_Next: UIButton!
    
    @IBOutlet weak var TEXT_Language: UITextField!
    @IBOutlet weak var TEXT_Ethnicith: UITextField!
    @IBOutlet weak var TEXT_Country: UITextField!
    
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
            LBL_Step4.isHidden = true
            
            BTN_Next.setTitle("SUBMIT", for: .normal)
            
            TEXT_Language.text = NikaDataManager.sharedDataManager.userProf.language
            TEXT_Ethnicith.text = NikaDataManager.sharedDataManager.userProf.ethnicity
            TEXT_Country.text = NikaDataManager.sharedDataManager.userProf.ethnicCtry            
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
        
        NikaDataManager.sharedDataManager.userProf.language = TEXT_Language.text
        NikaDataManager.sharedDataManager.userProf.ethnicity = TEXT_Ethnicith.text
        NikaDataManager.sharedDataManager.userProf.ethnicCtry = TEXT_Country.text
        
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
            let baseNav : CreateProfilePhotosCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfilePhotosCtrlr") as! CreateProfilePhotosCtrlr
            
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
