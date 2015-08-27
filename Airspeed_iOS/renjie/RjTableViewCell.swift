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
       
//         let image = UIImage.circleImage(UIImage(named: "creame"), borderWidth: 2.0, borderColor: UIColor.purpleColor())
//        pIImage.setImage(image, forState: UIControlState.Normal)
        pIImage.layer.masksToBounds = true
        pIImage.layer.cornerRadius = 30
        pIImage.layer.borderWidth = 2.0
        pIImage.layer.borderColor = UIColor.purpleColor().CGColor
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
   
    @IBOutlet weak var pIImage: UIImageView!


    
    
    
}
