//
//  NikaSettingsCell.swift
//  Nika
//
//  Created by Basavaraj on 12/09/19.
//  Copyright © 2019 1836. All rights reserved.
//

import UIKit

class NikaSettingsCell: UITableViewCell {

    @IBOutlet weak var VIEW_Container: UIView!
    @IBOutlet weak var IMG_Profile: UIImageView!
    @IBOutlet weak var LBL_Settings: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
