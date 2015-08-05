//
//  ArticTableViewCell.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/3.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class ArticTableViewCell: UITableViewCell {
    
//    MARK: IBOutlet
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
    
    //配置默认的cell
    func configCellWithStatusModel(model:StatusModel){
        
        self.articName.text = model.name
        self.articMoney.text = model.money
        self.articimage.image = model.imge!
        
    }

}
