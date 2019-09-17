//
//  NikaOnBoardingContentController.swift
//  Nika
//
//  Created by Basavaraj  on 06/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

protocol NikaOnBoardingContentControllerDelegate : class
{
    func firstPageGetStartedTapped()
    func secondPageGetStartedTapped()
    func thirdPageGetStartedTapped()
}

class NikaOnBoardingContentController: UIViewController {

    @IBOutlet weak var mIconView: UIImageView!
    @IBOutlet weak var View_ImageHolder: UIView!
    @IBOutlet weak var IMG_PictView: UIImageView!
    
    @IBOutlet weak var View_Bottom: UIView!
    @IBOutlet weak var Btn_SetStarted: UIButton!
    @IBOutlet weak var Lbl_Bottom: UILabel!
    @IBOutlet weak var View_Indicators: UIView!
    @IBOutlet weak var View1_Indicator: UIView!
    @IBOutlet weak var View2_Indicator: UIView!
    @IBOutlet weak var View3_Indicator: UIView!
    
    weak var pageContentDelegate : NikaOnBoardingContentControllerDelegate!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        
        self.updateForPage(pageNumber: 0)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        Btn_SetStarted.addCornerRadius(cornerRadius: 15.0)
        
        View_ImageHolder.addCornerRadius(cornerRadius: 10.0)
        IMG_PictView.addCornerRadius(cornerRadius: 10.0)
        
        View1_Indicator.addCornerRadius(cornerRadius: 2.0)
        View2_Indicator.addCornerRadius(cornerRadius: 2.0)
        View3_Indicator.addCornerRadius(cornerRadius: 2.0)
        
        Btn_SetStarted.addShadow()
        
        View1_Indicator.addShadow()
        View2_Indicator.addShadow()
        View3_Indicator.addShadow()
        
        View_ImageHolder.addShadow()
    }
    
    func updateForPage(pageNumber : Int)  {
        
        View1_Indicator.backgroundColor = UIColor.lightGray
        View2_Indicator.backgroundColor = UIColor.lightGray
        View3_Indicator.backgroundColor = UIColor.lightGray
        
        if(0 == pageNumber)
        {
            View1_Indicator.backgroundColor = UIColor.nikeMatchPurpleColor()
        }
        else if(1 == pageNumber)
        {
            View2_Indicator.backgroundColor = UIColor.nikeMatchPurpleColor()
        }
        else if(2 == pageNumber)
        {
            View3_Indicator.backgroundColor = UIColor.nikeMatchPurpleColor()
        }
        
    }

    @IBAction func pageOneGetStartedTapped(_ sender: UIButton)
    {
        self.pageContentDelegate.firstPageGetStartedTapped()
    }
    
    @IBAction func pageTwoGetStartedTapped(_ sender: UIButton)
    {
        self.pageContentDelegate.secondPageGetStartedTapped()
    }
    
    @IBAction func pagethreeeGetStartedTapped(_ sender: UIButton)
    {
        self.pageContentDelegate.thirdPageGetStartedTapped()
    }
}
