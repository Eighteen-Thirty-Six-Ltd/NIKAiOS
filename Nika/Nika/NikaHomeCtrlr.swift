//
//  NikaHomeCtrlr.swift
//  Nika
//
//  Created by Basavaraj  on 06/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaHomeCtrlr: UIViewController {

    @IBOutlet weak var VIEW_Bottom: UIView!
    
    @IBOutlet weak var VIEW_First: UIView!
    @IBOutlet weak var VIEW_SepFirst: UIView!
    @IBOutlet weak var LBL_First: UILabel!
    
    @IBOutlet weak var VIEW_Second: UIView!
    @IBOutlet weak var VIEW_SepSecond: UIView!
    @IBOutlet weak var LBL_Second: UILabel!
    
    @IBOutlet weak var VIEW_Third: UIView!
    @IBOutlet weak var VIEW_SepThird: UIView!
    @IBOutlet weak var LBL_Third: UILabel!
    
    @IBOutlet weak var VIEW_Fourth: UIView!
    @IBOutlet weak var VIEW_SepFourth: UIView!
    @IBOutlet weak var LBL_Fourth: UILabel!
    
    @IBOutlet weak var VIEW_Top: UIView!
    
    @IBOutlet weak var VIEW_Container: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.ViewOneGestureTapped(UITapGestureRecognizer())
    }
    

    @IBAction func ViewOneGestureTapped(_ sender: UITapGestureRecognizer) {
        
        VIEW_SepFirst.isHidden = false
        VIEW_SepSecond.isHidden = true
        VIEW_SepThird.isHidden = true
        VIEW_SepFourth.isHidden = true
        
        LBL_First.textColor = UIColor.nikeMatchPurpleColor()
        LBL_Second.textColor = UIColor.black
        LBL_Third.textColor = UIColor.black
        LBL_Fourth.textColor = UIColor.black
        
        let nikaExploreCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "NikaExplorectrlr")
        
        nikaExploreCtrlr?.view.frame = VIEW_Container.bounds
        self.VIEW_Container.addSubview(nikaExploreCtrlr!.view)
        
        self.addChild(nikaExploreCtrlr!)
        nikaExploreCtrlr?.didMove(toParent: self)
    }
    
    @IBAction func ViewTwoGestureTapped(_ sender: UITapGestureRecognizer) {
        
        VIEW_SepFirst.isHidden = true
        VIEW_SepSecond.isHidden = false
        VIEW_SepThird.isHidden = true
        VIEW_SepFourth.isHidden = true
        
        LBL_First.textColor = UIColor.black
        LBL_Second.textColor = UIColor.nikeMatchPurpleColor()
        LBL_Third.textColor = UIColor.black
        LBL_Fourth.textColor = UIColor.black
        
        let nikaMatchesCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "NikaMatchesctrlr")
        
        nikaMatchesCtrlr?.view.frame = VIEW_Container.bounds
        self.VIEW_Container.addSubview(nikaMatchesCtrlr!.view)
        
        self.addChild(nikaMatchesCtrlr!)
        nikaMatchesCtrlr?.didMove(toParent: self)
    }
    
    @IBAction func ViewThreeGestureTapped(_ sender: UITapGestureRecognizer) {
        
        LBL_First.textColor = UIColor.black
        LBL_Second.textColor = UIColor.black
        LBL_Third.textColor = UIColor.nikeMatchPurpleColor()
        LBL_Fourth.textColor = UIColor.black
        
        VIEW_SepFirst.isHidden = true
        VIEW_SepSecond.isHidden = true
        VIEW_SepThird.isHidden = false
        VIEW_SepFourth.isHidden = true
        
        let chatStoryboard = UIStoryboard(name: "Chats", bundle: nil)
        
        let nikaChatsCtrlr = chatStoryboard.instantiateViewController(withIdentifier: "NikaChatsViewCtrlr")
        
        nikaChatsCtrlr.view.frame = VIEW_Container.bounds
        self.VIEW_Container.addSubview(nikaChatsCtrlr.view)
        
        self.addChild(nikaChatsCtrlr)
        nikaChatsCtrlr.didMove(toParent: self)
    }
    
    @IBAction func ViewFourGestureTapped(_ sender: UITapGestureRecognizer) {
        
        LBL_First.textColor = UIColor.black
        LBL_Second.textColor = UIColor.black
        LBL_Third.textColor = UIColor.black
        LBL_Fourth.textColor = UIColor.nikeMatchPurpleColor()
        
        VIEW_SepFirst.isHidden = true
        VIEW_SepSecond.isHidden = true
        VIEW_SepThird.isHidden = true
        VIEW_SepFourth.isHidden = false
        
        let nikaMyAccountCtrlr = self.storyboard?.instantiateViewController(withIdentifier: "NikaMyAccountViewCtrlr")
        
        nikaMyAccountCtrlr?.view.frame = VIEW_Container.bounds
        self.VIEW_Container.addSubview(nikaMyAccountCtrlr!.view)
        
        self.addChild(nikaMyAccountCtrlr!)
        nikaMyAccountCtrlr?.didMove(toParent: self)
    }
    
}
