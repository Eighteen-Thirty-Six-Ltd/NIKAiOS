//
//  NikaExplorectrlr.swift
//  Nika
//
//  Created by Basavaraj  on 09/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaExplorectrlr: UIViewController, UITableViewDataSource, UITableViewDelegate {

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
        
        let nikaExplor : NikaExploreCell = tableView.dequeueReusableCell(withIdentifier: "NikaExploreCell", for: indexPath) as! NikaExploreCell
        
        nikaExplor.VIEW_Container.addCornerRadius(cornerRadius: 30.0)
        
        return nikaExplor
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let baseNav = self.storyboard?.instantiateViewController(withIdentifier: "NikaProfileDetailCtrlr")
        self.present(baseNav!, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 500.0
    }

}
