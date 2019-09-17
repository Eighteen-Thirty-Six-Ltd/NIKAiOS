//
//  NikaMatchesctrlr.swift
//  Nika
//
//  Created by Basavaraj  on 09/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaMatchesctrlr: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var BTN_MatchedUsers: UIButton!
    @IBOutlet weak var BTN_UnmatchedUsers: UIButton!
    
    @IBOutlet weak var VIEW_MatchedSelectedUsers: UIView!
    @IBOutlet weak var VIEW_UnmatchedUsers_Selected: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        VIEW_MatchedSelectedUsers.addCornerRadius(cornerRadius: 2.0)
        VIEW_UnmatchedUsers_Selected.addCornerRadius(cornerRadius: 2.0)
        
        VIEW_MatchedSelectedUsers.addShadow()
        VIEW_UnmatchedUsers_Selected.addShadow()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.btnUnmatchedUsersTapped(BTN_UnmatchedUsers)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nikaExplor : NikaExploreCell = tableView.dequeueReusableCell(withIdentifier: "NikaExploreCell", for: indexPath) as! NikaExploreCell
        
//        nikaExplor.VIEW_Container.addCornerRadius(cornerRadius: 30.0)
        
        return nikaExplor
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300.0
    }

    @IBAction func btnMatchedUserstapped(_ sender: UIButton) {
        
        VIEW_MatchedSelectedUsers.isHidden = false
        VIEW_UnmatchedUsers_Selected.isHidden = true
        
        BTN_MatchedUsers.setTitleColor(UIColor.nikeMatchPurpleColor(), for: .normal)
        BTN_UnmatchedUsers.setTitleColor(UIColor.nikeMatchPurpleColorLessAlpha(), for: .normal)
    }
    
    @IBAction func btnUnmatchedUsersTapped(_ sender: UIButton) {
        
        VIEW_MatchedSelectedUsers.isHidden = true
        VIEW_UnmatchedUsers_Selected.isHidden = false
        
        BTN_MatchedUsers.setTitleColor(UIColor.nikeMatchPurpleColorLessAlpha(), for: .normal)
        BTN_UnmatchedUsers.setTitleColor(UIColor.nikeMatchPurpleColor(), for: .normal)
    }
}
