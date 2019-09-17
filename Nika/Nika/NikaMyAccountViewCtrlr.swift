//
//  NikaMyAccountViewCtrlr.swift
//  Nika
//
//  Created by Basavaraj  on 09/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaMyAccountViewCtrlr: UIViewController, UITableViewDataSource, UITableViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell : UITableViewCell = UITableViewCell()
        
        let nikaExplor : NikaSettingsCell = tableView.dequeueReusableCell(withIdentifier: "NikaSettingsCell", for: indexPath) as! NikaSettingsCell
        
        if (0 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "SettingsProfile")
            nikaExplor.LBL_Settings.text = "Edit Profile"
            
            cell = nikaExplor
        }
        else if (1 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "SettingsBlock")
            nikaExplor.LBL_Settings.text = "Blocked Users"
            
            cell = nikaExplor
        }
        else if (2 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "SettingsChaperone")
            nikaExplor.LBL_Settings.text = "Chaperone"
            
            cell = nikaExplor
        }
        else if (3 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "SettingsBlog")
            nikaExplor.LBL_Settings.text = "Nika Match Blog"
            
            cell = nikaExplor
        }
        else if (4 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "SettingsCache")
            nikaExplor.LBL_Settings.text = "Clear Cache"
            
            cell = nikaExplor
        }
        else if (5 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "SettingsChangePwd")
            nikaExplor.LBL_Settings.text = "Change Password"
            
            cell = nikaExplor
        }
        else if (6 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "SettingsTermsOfService")
            nikaExplor.LBL_Settings.text = "Terms of Service"
            
            cell = nikaExplor
        }
        else if (7 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "SettingsPrivacyPolicy")
            nikaExplor.LBL_Settings.text = "Privacy Policy"
            
            cell = nikaExplor
        }
        else if (8 == indexPath.row)
        {
            nikaExplor.IMG_Profile.image = UIImage(named: "SettingsRateUs")
            nikaExplor.LBL_Settings.text = "Rate us on the App Store"
            
            cell = nikaExplor
        }
        else if (9 == indexPath.row)
        {            
            let nikaLogOutCell : NikaLogOutCell = tableView.dequeueReusableCell(withIdentifier: "NikaLogOutCell") as! NikaLogOutCell
            
            cell = nikaLogOutCell
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if (0 == indexPath.row)
        {
            let profileStoryboard = UIStoryboard(name: "Profile", bundle: nil)
            let baseNav = profileStoryboard.instantiateViewController(withIdentifier: "EditProfileViewCtrlr")
            self.present(baseNav, animated: true, completion: nil)
        }
        else if (1 == indexPath.row)
        {
            let baseNav = self.storyboard?.instantiateViewController(withIdentifier: "NikaBlockedUsersCtrlr")
            self.present(baseNav!, animated: true, completion: nil)
        }
        else if (2 == indexPath.row)
        {
            
        }
        else if (3 == indexPath.row)
        {
            
        }
        else if (4 == indexPath.row)
        {
            
        }
        else if (5 == indexPath.row)
        {
            
        }
        else if (6 == indexPath.row)
        {
            let baseNav = self.storyboard?.instantiateViewController(withIdentifier: "NikaTermsAndConditionsCtrlr")
            self.present(baseNav!, animated: true, completion: nil)
        }
        else if (7 == indexPath.row)
        {
            let baseNav = self.storyboard?.instantiateViewController(withIdentifier: "NikaPrivacyCtrlr")
            self.present(baseNav!, animated: true, completion: nil)
        }
        else if (8 == indexPath.row)
        {
            
        }
        else if (9 == indexPath.row)
        {
            
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        var height = 70.0
        
        if (9 == indexPath.row)
        {
            height = 200.0
        }
        
        return CGFloat(height)

    }

}
