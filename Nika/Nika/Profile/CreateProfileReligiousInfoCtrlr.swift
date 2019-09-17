//
//  CreateProfileReligiousInfoCtrlr.swift
//  Nika
//
//  Created by Manohar T on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class CreateProfileReligiousInfoCtrlr: UIViewController {

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
    
    @IBOutlet weak var BTN_Next: UIButton!
    
    var isEditMode = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        BTN_Next.addCornerRadius(cornerRadius: 10.0)
        BTN_Next.addShadow()
    }
    
    @IBAction func nextTapped(_ sender: UIButton) {
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
    }
    
    @IBAction func shiaTapped(_ sender: Any) {
        
        BTN_Sunni.isSelected = false
        BTN_Shia.isSelected = true
        BTN_Other.isSelected = false
    }
    
    @IBAction func otherTapped(_ sender: Any) {
        
        BTN_Sunni.isSelected = false
        BTN_Shia.isSelected = false
        BTN_Other.isSelected = true
    }
    
    @IBAction func veryReligiousTapped(_ sender: Any) {
        
        BTN_VeryReligious.isSelected = true
        BTN_SomeWhat.isSelected = false
        BTN_NotReligious.isSelected = false
    }
    
    @IBAction func someWhatReligiousTapped(_ sender: Any) {
        
        BTN_VeryReligious.isSelected = false
        BTN_SomeWhat.isSelected = true
        BTN_NotReligious.isSelected = false
    }
    
    @IBAction func NotReligiousTapped(_ sender: Any) {
        
        BTN_VeryReligious.isSelected = false
        BTN_SomeWhat.isSelected = false
        BTN_NotReligious.isSelected = true
    }
    
    @IBAction func regularTapped(_ sender: Any) {
        
        BTN_Regular.isSelected = true
        BTN_Usual.isSelected = false
        BTN_Sometimes.isSelected = false
        BTN_Rarely.isSelected = false
        BTN_Never.isSelected = false
    }
    
    @IBAction func usualTapped(_ sender: Any) {
        
        BTN_Regular.isSelected = false
        BTN_Usual.isSelected = true
        BTN_Sometimes.isSelected = false
        BTN_Rarely.isSelected = false
        BTN_Never.isSelected = false
    }
    
    @IBAction func someTimesTapped(_ sender: Any) {
        
        BTN_Regular.isSelected = false
        BTN_Usual.isSelected = false
        BTN_Sometimes.isSelected = true
        BTN_Rarely.isSelected = false
        BTN_Never.isSelected = false
    }
    
    @IBAction func rarelyTapped(_ sender: Any) {
        
        BTN_Regular.isSelected = false
        BTN_Usual.isSelected = false
        BTN_Sometimes.isSelected = false
        BTN_Rarely.isSelected = true
        BTN_Never.isSelected = false
    }
    
    @IBAction func neverTapped(_ sender: Any) {
        
        BTN_Regular.isSelected = false
        BTN_Usual.isSelected = false
        BTN_Sometimes.isSelected = false
        BTN_Rarely.isSelected = false
        BTN_Never.isSelected = true
    }
    
    
    @IBAction func nectFiveTapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = true
        BTN_NextTwoThree.isSelected = false
        BTN_NextOneTwo.isSelected = false
        BTN_AsSoonAsPossible.isSelected = false
        BTN_NeverMeet.isSelected = false
        BTN_NotDecided.isSelected = false
    }
    
    @IBAction func nextTwotoThreetapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = false
        BTN_NextTwoThree.isSelected = true
        BTN_NextOneTwo.isSelected = false
        BTN_AsSoonAsPossible.isSelected = false
        BTN_NeverMeet.isSelected = false
        BTN_NotDecided.isSelected = false
    }
    
    @IBAction func nextOneTwoTapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = false
        BTN_NextTwoThree.isSelected = false
        BTN_NextOneTwo.isSelected = true
        BTN_AsSoonAsPossible.isSelected = false
        BTN_NeverMeet.isSelected = false
        BTN_NotDecided.isSelected = false
    }
    
    @IBAction func asapTapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = false
        BTN_NextTwoThree.isSelected = false
        BTN_NextOneTwo.isSelected = false
        BTN_AsSoonAsPossible.isSelected = true
        BTN_NeverMeet.isSelected = false
        BTN_NotDecided.isSelected = false
    }
    
    @IBAction func neverMeetTapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = false
        BTN_NextTwoThree.isSelected = false
        BTN_NextOneTwo.isSelected = false
        BTN_AsSoonAsPossible.isSelected = false
        BTN_NeverMeet.isSelected = true
        BTN_NotDecided.isSelected = false
    }
    
    @IBAction func notDecidedTapped(_ sender: Any) {
        
        BTN_NextFive.isSelected = false
        BTN_NextTwoThree.isSelected = false
        BTN_NextOneTwo.isSelected = false
        BTN_AsSoonAsPossible.isSelected = false
        BTN_NeverMeet.isSelected = false
        BTN_NotDecided.isSelected = true
    }
}
