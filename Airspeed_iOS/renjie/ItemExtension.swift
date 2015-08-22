//
//  ItemExtension.swift
//  Airspeed_iOS
//
//  Created by 仇寻 on 15/8/20.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

//扩展UIBarButtonItem
extension UIBarButtonItem{
    
    static func item(target:AnyObject,action:Selector,image:String,HighImage:String) -> UIBarButtonItem{
        let item:UIButton = UIButton()
        item.setBackgroundImage(UIImage(named: image), forState: UIControlState.Normal)
        item.setBackgroundImage(UIImage(named:HighImage), forState: UIControlState.Highlighted)
        item.frame.size = item.currentBackgroundImage!.size
        item.addTarget(target, action: action, forControlEvents: UIControlEvents.TouchUpInside)
        
        return  UIBarButtonItem(customView: item)
    }

}
