//
//  MenuTableViewCell.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/5.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit
/// 同城物品列表的cell 
class MenuTableViewCell: UITableViewCell {
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var money: UILabel!
    @IBOutlet weak var imageview: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    self.selectionStyle = .None
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    

}
