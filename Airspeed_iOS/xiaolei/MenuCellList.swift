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
    
    //这是一个单例
  static let defaultData = MenuCellList(url: NSURL(string: "http://image.baidu.com/search/down?tn=download&word=download&ie=utf8&fr=detail&url=http%3A%2F%2Fimg1.gtimg.com%2Ftech%2Fpics%2Fhv1%2F189%2F25%2F1654%2F107557914.png&thumburl=http%3A%2F%2Fimg4.imgtn.bdimg.com%2Fit%2Fu%3D2228125611%2C986142235%26fm%3D21%26gp%3D0.jpg")!, name: "Swift")

}