//
//  ItemsSimpleInfo.swift
//  Airspeed_iOS
//
//  Created by 王卓 on 15/8/26.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class ItemsSimpleInfo: NSObject {
    //var itemImgeURL:NSURL
    var itemImage:UIImage
    var itemName:String
    var itemCategory:String
    var itemOnSaleDate:String
    
    init(name:String,category:String,date:String){
        self.itemName = name
        self.itemImage = UIImage(named: "icon.jpg")!
        self.itemCategory = category
        self.itemOnSaleDate = date
    }
    
}