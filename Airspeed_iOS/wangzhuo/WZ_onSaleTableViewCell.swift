//
//  WZ_onSaleTableViewCell.swift
//  Airspeed_iOS
//
//  Created by 王卓 on 15/8/26.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class WZ_onSaleTableViewCell: UITableViewCell {
    @IBOutlet weak var itemImage: UIImageView!
    @IBOutlet weak var itemName: UILabel!
    @IBOutlet weak var itemCategory: UILabel!
    @IBOutlet weak var onSaleDate: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
