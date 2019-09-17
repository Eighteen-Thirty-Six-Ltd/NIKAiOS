//
//  EditProfileViewCtrlr.swift
//  Nika
//
//  Created by Manohar T on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class EditProfileViewCtrlr: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnBackTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nikaExplor : NikaSettingsCell = tableView.dequeueReusableCell(withIdentifier: "NikaSettingsEditCell", for: indexPath) as! NikaSettingsCell
        
        if (0 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "")
            nikaExplor.LBL_Settings.text = "Basic Information"
        }
        else if (1 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "")
            nikaExplor.LBL_Settings.text = "Education & Career"
        }
        else if (2 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "")
            nikaExplor.LBL_Settings.text = "Islamic Lifestyle"
        }
        else if (3 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "")
            nikaExplor.LBL_Settings.text = "Language & Ethnicity"
        }
        else if (4 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "")
            nikaExplor.LBL_Settings.text = "Photos"
        }        
        
        return nikaExplor
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (0 == indexPath.row)
        {
            let baseNav : CreateProfileBasicCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileBasicCtrlr") as! CreateProfileBasicCtrlr
            baseNav.isEditMode = true
            
            self.present(baseNav, animated: true, completion: nil)
        }
        else if (1 == indexPath.row)
        {
            let baseNav : CreateProfileEduInfoCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileEduInfoCtrlr") as! CreateProfileEduInfoCtrlr
            baseNav.isEditMode = true
            
            self.present(baseNav, animated: true, completion: nil)
        }
        else if (2 == indexPath.row)
        {
            let baseNav : CreateProfileReligiousInfoCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileReligiousInfoCtrlr") as! CreateProfileReligiousInfoCtrlr
            baseNav.isEditMode = true
            
            self.present(baseNav, animated: true, completion: nil)
        }
        else if (3 == indexPath.row)
        {
            let baseNav : CreateProfileLanguageInfoCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileLanguageInfoCtrlr") as! CreateProfileLanguageInfoCtrlr
            baseNav.isEditMode = true
            
            self.present(baseNav, animated: true, completion: nil)
        }
        else if (4 == indexPath.row)
        {
            let baseNav : CreateProfilePhotosCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfilePhotosCtrlr") as! CreateProfilePhotosCtrlr
            baseNav.isEditMode = true
            
            self.present(baseNav, animated: true, completion: nil)
        }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100.0
    }
}
