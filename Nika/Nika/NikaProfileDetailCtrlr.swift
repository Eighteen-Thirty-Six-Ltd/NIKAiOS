//
//  NikaProfileDetailCtrlr.swift
//  Nika
//
//  Created by Basavaraj on 11/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaProfileDetailCtrlr: UIViewController {

    @IBOutlet weak var VIEW_Content: UIView!
    @IBOutlet weak var VIEW_Paths: UIView!
    @IBOutlet weak var VIEW_Photos: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        VIEW_Content.addCornerRadius(cornerRadius: 10.0)
        VIEW_Paths.addCornerRadius(cornerRadius: 10.0)
        VIEW_Photos.addCornerRadius(cornerRadius: 10.0)
        
        VIEW_Content.addShadow()
        VIEW_Paths.addShadow()
        VIEW_Photos.addShadow()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func backTapped(_ sender: UIButton) {
        
        self.dismiss(animated: true) {
            
        }
    }
    
}
