//
//  StatusModel.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/5.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import Foundation

class ArticInformation {
    
    let name:String
    let money:Double
    let imge = UIImage(named: "icon.jpg")
    
    init(name:String,money:Double){
        self.name = name
        self.money = money
    }
}