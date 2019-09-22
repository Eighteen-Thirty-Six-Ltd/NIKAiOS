//
//  CreateProfileReligiousInfoCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class CreateProfileReligiousInfoCtrlr: UIViewController {

    @IBOutlet weak var LBL_Step3: UILabel!
    @IBOutlet weak var LBL_Header: UILabel!
    
    @IBOutlet weak var BTN_Sunni: UIButton!
    @IBOutlet weak var BTN_Shia: UIButton!
    @IBOutlet weak var BTN_Other: UIButton!
    
    @IBOutlet weak var BTN_VeryReligious: UIButton!
    @IBOutlet weak var BTN_SomeWhat: UIButton!
    @IBOutlet weak var BTN_NotReligious: UIButton!
    
    @IBOutlet weak var BTN_Regular: UIButton!
    @IBOutlet weak var BTN_Usual: UIButton!
    @IBOutlet weak var BTN_Sometimes: UIButton!
    @IBOutlet weak var BTN_Rarely: UIButton!
    @IBOutlet weak var BTN_Never: UIButton!
    
    @IBOutlet weak var BTN_NextFive: UIButton!
    @IBOutlet weak var BTN_NextTwoThree: UIButton!
    @IBOutlet weak var BTN_NextOneTwo: UIButton!
    @IBOutlet weak var BTN_AsSoonAsPossible: UIButton!
    @IBOutlet weak var BTN_NeverMeet: UIButton!
    @IBOutlet weak var BTN_NotDecided: UIButton!
    
    @IBOutlet weak var SWITCH_Alcohol: UISwitch!
    @IBOutlet weak var SWITCH_Halal: UISwitch!
    @IBOutlet weak var SWITCH_Smoke: UISwitch!
    
    @IBOutlet weak var BTN_Next: UIButton!
    
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
            LBL_Step3.isHidden = true
            
            BTN_Next.setTitle("SUBMIT", for: .normal)
            
            if (NikaDataManager.sharedDataManager.userProf.sect == "Sunni")
            {
                self.sunniTapped(BTN_Sunni)
            }
            else if (NikaDataManager.sharedDataManager.userProf.sect == "Shia")
            {
                self.shiaTapped(BTN_Shia)
            }
            else if (NikaDataManager.sharedDataManager.userProf.sect == "Other")
            {
                self.otherTapped(BTN_Other)
            }
            
            if(NikaDataManager.sharedDataManager.userProf.religious == "Very")
            {
                self.veryReligiousTapped(BTN_VeryReligious)
            }
            else if(NikaDataManager.sharedDataManager.userProf.religious == "Somewhat")
            {
                self.someTimesTapped(BTN_VeryReligious)
            }
            else if(NikaDataManager.sharedDataManager.userProf.religious == "Not")
            {
                self.NotReligiousTapped(BTN_VeryReligious)
            }
            
            if(NikaDataManager.sharedDataManager.userProf.pray == "Regular")
            {
                self.regularTapped(BTN_Regular)
            }
            else if(NikaDataManager.sharedDataManager.userProf.pray == "Usual")
            {
                self.usualTapped(BTN_Usual)
            }
            else if(NikaDataManager.sharedDataManager.userProf.pray == "Sometimes")
            {
                self.someTimesTapped(BTN_Sometimes)
            }
            else if(NikaDataManager.sharedDataManager.userProf.pray == "Rarely")
            {
                self.rarelyTapped(BTN_Rarely)
            }
            else if(NikaDataManager.sharedDataManager.userProf.pray == "Never")
            {
                self.neverTapped(BTN_Never)
            }
            
            if(NikaDataManager.sharedDataManager.userProf.marry == "NextFive")
            {
                self.nectFiveTapped(BTN_NextFive)
            }
            else if(NikaDataManager.sharedDataManager.userProf.marry == "Next23")
            {
                self.nextTwotoThreetapped(BTN_NextTwoThree)
            }
            else if(NikaDataManager.sharedDataManager.userProf.marry == "Next12")
            {
                self.nextOneTwoTapped(BTN_NextOneTwo)
            }
            else if(NikaDataManager.sharedDataManager.userProf.marry == "ASAP")
            {
                self.asapTapped(BTN_AsSoonAsPossible)
            }
            else if(NikaDataManager.sharedDataManager.userProf.marry == "NeverMarry")
            {
                self.neverMeetTapped(BTN_NeverMeet)
            }
            else if(NikaDataManager.sharedDataManager.userProf.marry == "ND")
            {
                self.notDecidedTapped(BTN_NotDecided)
            }
            
            if(NikaDataManager.sharedDataManager.userProf.alcohol == "YES")
            {
                self.SWITCH_Alcohol.isOn = true
            }
            
            if(NikaDataManager.sharedDataManager.userProf.halal == "YES")
            {
                self.SWITCH_Halal.isOn = true
            }
            
            if(NikaDataManager.sharedDataManager.userProf.smoke == "YES")
            {
                self.SWITCH_Smoke.isOn = true
            }
        }
        else
        {
            self.SWITCH_Alcohol.isOn = false
            self.SWITCH_Halal.isOn = false
            self.SWITCH_Smoke.isOn = false
            
            LBL_Header.text = "Create Profile"
            BTN_Next.setTitle("NEXT", for: .normal)
        }
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
        
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
            let baseNav : CreateProfileLanguageInfoCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "CreateProfileLanguageInfoCtrlr") as! CreateProfileLanguageInfoCtrlr
            
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
    
    @IBAction func sunniTapped(_ sender: UIButton) {
        
        BTN_Sunni.isSelected = true
        BTN_Shia.isSelected = false
        BTN_Other.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.sect = "Sunni"
    }
    
    @IBAction func shiaTapped(_ sender: Any) {
        
        BTN_Sunni.isSelected = false
        BTN_Shia.isSelected = true
        BTN_Other.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.sect = "Shia"
    }
    
    @IBAction func otherTapped(_ sender: Any) {
        
        BTN_Sunni.isSelected = false
        BTN_Shia.isSelected = false
        BTN_Other.isSelected = true
        
        NikaDataManager.sharedDataManager.userProf.sect = "Other"
    }
    
    @IBAction func veryReligiousTapped(_ sender: Any) {
        
        BTN_VeryReligious.isSelected = true
        BTN_SomeWhat.isSelected = false
        BTN_NotReligious.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.religious = "Very"
    }
    
    @IBAction func someWhatReligiousTapped(_ sender: Any) {
        
        BTN_VeryReligious.isSelected = false
        BTN_SomeWhat.isSelected = true
        BTN_NotReligious.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.religious = "Somewhat"
    }
    
    @IBAction func NotReligiousTapped(_ sender: Any) {
        
        BTN_VeryReligious.isSelected = false
        BTN_SomeWhat.isSelected = false
        BTN_NotReligious.isSelected = true
        
        NikaDataManager.sharedDataManager.userProf.religious = "Not"
    }
    
    @IBAction func regularTapped(_ sender: Any) {
        
        BTN_Regular.isSelected = true
        BTN_Usual.isSelected = false
        BTN_Sometimes.isSelected = false
        BTN_Rarely.isSelected = false
        BTN_Never.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.pray = "Regular"
    }
    
    @IBAction func usualTapped(_ sender: Any) {
        
        BTN_Regular.isSelected = false
        BTN_Usual.isSelected = true
        BTN_Sometimes.isSelected = false
        BTN_Rarely.isSelected = false
        BTN_Never.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.pray = "Usual"
    }
    
    @IBAction func someTimesTapped(_ sender: Any) {
        
        BTN_Regular.isSelected = false
        BTN_Usual.isSelected = false
        BTN_Sometimes.isSelected = true
        BTN_Rarely.isSelected = false
        BTN_Never.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.pray = "Sometimes"
    }
    
    @IBAction func rarelyTapped(_ sender: Any) {
        
        BTN_Regular.isSelected = false
        BTN_Usual.isSelected = false
        BTN_Sometimes.isSelected = false
        BTN_Rarely.isSelected = true
        BTN_Never.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.pray = "Rarely"
    }
    
    @IBAction func neverTapped(_ sender: Any) {
        
        BTN_Regular.isSelected = false
        BTN_Usual.isSelected = false
        BTN_Sometimes.isSelected = false
        BTN_Rarely.isSelected = false
        BTN_Never.isSelected = true
        
        NikaDataManager.sharedDataManager.userProf.pray = "Never"
    }
    
    
    @IBAction func nectFiveTapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = true
        BTN_NextTwoThree.isSelected = false
        BTN_NextOneTwo.isSelected = false
        BTN_AsSoonAsPossible.isSelected = false
        BTN_NeverMeet.isSelected = false
        BTN_NotDecided.isSelected = false
        
         NikaDataManager.sharedDataManager.userProf.marry = "NextFive"
    }
    
    @IBAction func nextTwotoThreetapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = false
        BTN_NextTwoThree.isSelected = true
        BTN_NextOneTwo.isSelected = false
        BTN_AsSoonAsPossible.isSelected = false
        BTN_NeverMeet.isSelected = false
        BTN_NotDecided.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.marry = "Next23"
    }
    
    @IBAction func nextOneTwoTapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = false
        BTN_NextTwoThree.isSelected = false
        BTN_NextOneTwo.isSelected = true
        BTN_AsSoonAsPossible.isSelected = false
        BTN_NeverMeet.isSelected = false
        BTN_NotDecided.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.marry = "Next12"
    }
    
    @IBAction func asapTapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = false
        BTN_NextTwoThree.isSelected = false
        BTN_NextOneTwo.isSelected = false
        BTN_AsSoonAsPossible.isSelected = true
        BTN_NeverMeet.isSelected = false
        BTN_NotDecided.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.marry = "ASAP"
    }
    
    @IBAction func neverMeetTapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = false
        BTN_NextTwoThree.isSelected = false
        BTN_NextOneTwo.isSelected = false
        BTN_AsSoonAsPossible.isSelected = false
        BTN_NeverMeet.isSelected = true
        BTN_NotDecided.isSelected = false
        
        NikaDataManager.sharedDataManager.userProf.marry = "NeverMarry"
    }
    
    @IBAction func notDecidedTapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = false
        BTN_NextTwoThree.isSelected = false
        BTN_NextOneTwo.isSelected = false
        BTN_AsSoonAsPossible.isSelected = false
        BTN_NeverMeet.isSelected = false
        BTN_NotDecided.isSelected = true
        
        NikaDataManager.sharedDataManager.userProf.marry = "ND"
    }
    
    
    @IBAction func alcoholTapped(_ sender: UISwitch) {
        
        if (sender.isOn)
        {
            NikaDataManager.sharedDataManager.userProf.alcohol = "YES"
        }
        else
        {
            NikaDataManager.sharedDataManager.userProf.alcohol = "NO"
        }
    }
    
    @IBAction func halalTapped(_ sender: UISwitch) {
        
        if (sender.isOn)
        {
            NikaDataManager.sharedDataManager.userProf.halal = "YES"
        }
        else
        {
            NikaDataManager.sharedDataManager.userProf.halal = "NO"
        }
    }
    
    @IBAction func smokeTapped(_ sender: UISwitch) {
        
        if (sender.isOn)
        {
            NikaDataManager.sharedDataManager.userProf.smoke = "YES"
        }
        else
        {
            NikaDataManager.sharedDataManager.userProf.smoke = "NO"
        }
    }
}
