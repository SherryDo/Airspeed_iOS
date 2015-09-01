//
//  CollectionDataSource.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/3.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import Foundation
/**
*  @author 这块显卡有点冷
*
*  分类列表的信息类
*/
class MenuCellList{
    
    var imgeURL:NSURL
    var name:String
    init(url:NSURL,name:String){
        self.name = name
        self.imgeURL = url
    }

}