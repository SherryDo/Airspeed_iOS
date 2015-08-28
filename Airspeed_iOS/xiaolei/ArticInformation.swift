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
    let imgeURL:NSURL?
    
    init(name:String,money:Double,imageurl:String)
    {
        self.name = name
        self.money = money
        
        if let url = NSURL(string: imageurl)
        {
            imgeURL = url
        }else{
            imgeURL = nil
        }
        
    }
}