//
//  NikaBlockedUserCell.swift
//  Nika
//
//  Created by Basavaraj on 11/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaBlockedUserCell: UITableViewCell {

    @IBOutlet weak var VIEW_Container: UIView!
    @IBOutlet weak var IMG_Container: UIImageView!
    @IBOutlet weak var LBL_Name: UILabel!
    @IBOutlet weak var BTN_UnBlock: UIButton!
    
    
    @IBAction func btnUnBlockTapped(_ sender: UIButton) {
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
