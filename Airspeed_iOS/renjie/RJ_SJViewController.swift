//
//  RJ_SJViewController.swift
//  Airspeed_iOS
//
//  Created by 仇寻 on 15/8/4.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class RJ_SJViewController:UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addPageMenu()
        self.view.backgroundColor = UIColor.lightGrayColor()
        self.navigationItem.title = "上架"
//        self.navigationItem.rightBarButtonItem?.title = "帮助"
//        self.navigationItem.leftBarButtonItem?.image = UIImage(contentsOfFile: "sherry_purple")
        
    }
    

 
    // MARK: - 添加PageMenu
    var scroll: XLScrollViewer!
    var tab1 = UIViewController()
    var tab2 = UIViewController()
    var tab3 = UIViewController()
    func addPageMenu() {
        let frame = CGRectMake(0,64, self.view.frame.size.width, self.view.frame.size.height - 64)   //如果没有导航栏，则去掉64
        //
        //        //对应填写两个数组
        
        
        let sb1 = UIStoryboard(name: "rj_Storyboard", bundle: nil)
        tab1 = sb1.instantiateViewControllerWithIdentifier("Test1_ViewControllerID")

        tab2 = sb1.instantiateViewControllerWithIdentifier("Test2_ViewControllerID")
        self.addChildViewController(tab1)
        self.addChildViewController(tab2)
        self.addChildViewController(tab3)
        let views = [tab1.view, tab2.view,tab3.view]
        let names = ["上架物品","上架需求","上架拍卖品"]
        
        //        //创建使用
        tab3.view.backgroundColor = UIColor.orangeColor()
        tab1.view.backgroundColor = UIColor.greenColor()
        tab2.view.backgroundColor = UIColor.blueColor()
        self.scroll = XLScrollViewer(frame: frame, withViews: views, withButtonNames: names, withThreeAnimation: 211)
        //
        //自定义各种属性。。打开查看
        //  self.scroll.xl_topBackImage =[UIImage imageNamed:@"10.jpg"];
<<<<<<< HEAD
        self.scroll.xl_topBackColor = UIColor.purpleColor()
        self.scroll.xl_sliderColor = UIColor.whiteColor()
=======
        self.scroll.xl_topBackColor = UIColor.whiteColor()
        self.scroll.xl_sliderColor = UIColor.blueColor()
>>>>>>> origin/develop
        self.scroll.xl_buttonColorNormal = UIColor.blackColor()
        self.scroll.xl_buttonColorSelected = UIColor.whiteColor()
        self.scroll.xl_buttonFont = 14
        self.scroll.xl_buttonToSlider = 7
        self.scroll.xl_sliderHeight = 3
        self.scroll.xl_topHeight = 40
        self.scroll.xl_isSliderCorner = true
        
        //加入控制器视图
        self.view.addSubview(scroll)
        
    }
    
    
    
}
