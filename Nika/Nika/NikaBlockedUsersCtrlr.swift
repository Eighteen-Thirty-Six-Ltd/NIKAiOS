//
//  NikaBlockedUsersCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 10/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaBlockedUsersCtrlr: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var VIEW_Top: UIView!
    @IBOutlet weak var BTN_Back: UIButton!
    @IBOutlet weak var LBL_Title: UILabel!
    
    @IBOutlet weak var TBL_BlockedList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let nikaBlockedUserCell : NikaBlockedUserCell = tableView.dequeueReusableCell(withIdentifier: "NikaBlockedUserCell", for: indexPath) as! NikaBlockedUserCell
        
        nikaBlockedUserCell.VIEW_Container.addCornerRadius(cornerRadius: 15.0)
        nikaBlockedUserCell.IMG_Container.addCornerRadius(cornerRadius: 15.0)
        
        
        return nikaBlockedUserCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90.0
    }

    @IBAction func btnBackTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true, completion: nil)
    }

}
