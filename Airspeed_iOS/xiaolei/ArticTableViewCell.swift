//
//  ArticTableViewCell.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/3.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class ArticTableViewCell: UITableViewCell {
    
    
    @IBOutlet weak var articimage: UIImageView!
    
    @IBOutlet weak var articMoney: UILabel!

    @IBOutlet weak var articName: UILabel!
    
    
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
