//
//  RjTableViewCell.swift
//  Airspeed_iOS
//
//  Created by 仇寻 on 15/8/22.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class RjTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       
        let image = UIImage.circleImage(UIImage(named: "creame"), borderWidth: 2.0, borderColor: UIColor.purpleColor())
        staffPhoto.setImage(image, forState: UIControlState.Normal)
//        staffPhoto.layer.masksToBounds = true
//        staffPhoto.layer.cornerRadius = 35
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    @IBOutlet weak var staffPhoto: UIButton!

    
    
    
}
