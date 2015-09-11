//
//  MainViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/6/23.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //加载所有的视图的根视图控制器
        loadAllViewController()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func loadAllViewController(){
        //        获取每个故事版的根视图控制器
        let yxl_RootViewController = UIStoryboard(name: "YXL_Storyboard", bundle: nil).instantiateInitialViewController() as! MyNavigationViewController
        
        let rj_RootViewController = UIStoryboard(name: "rj_Storyboard", bundle: nil).instantiateInitialViewController() as! UINavigationController
        
        let wz_RootViewController = UIStoryboard(name: "WZ_StoryBoard", bundle: nil).instantiateInitialViewController() as!UINavigationController
        
        let yxl2_ViewController = UIStoryboard(name: "YXL2_Storyboard", bundle: nil).instantiateInitialViewController() as! UINavigationController
        
        //设置tabbar被选中时的字体颜色
        let selectedText = [NSForegroundColorAttributeName:UIColor.purpleColor()]
        yxl_RootViewController.tabBarItem.setTitleTextAttributes(selectedText, forState: UIControlState.Selected)
        
        rj_RootViewController.tabBarItem.setTitleTextAttributes(selectedText, forState: UIControlState.Selected)
        wz_RootViewController.tabBarItem.setTitleTextAttributes(selectedText, forState: UIControlState.Selected)
        yxl2_ViewController.tabBarItem.setTitleTextAttributes(selectedText, forState: UIControlState.Selected)
        
        //        设置 tabBarItem的一些属性
        //1
        yxl_RootViewController.tabBarItem.title = "租赁"
        yxl_RootViewController.tabBarItem.image = UIImage(named: "zuLin")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        yxl_RootViewController.tabBarItem.selectedImage = UIImage(named: "zuLin_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        //2
        yxl2_ViewController.tabBarItem.title = "同城"
        yxl2_ViewController.tabBarItem.image = UIImage(named: "Cd")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        yxl2_ViewController.tabBarItem.selectedImage = UIImage(named: "Cd_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        //3imageWithRenderingMode添加image渲染，使其保持为图片原色
        rj_RootViewController.tabBarItem.title = "上架"
        rj_RootViewController.tabBarItem.image = UIImage(named: "tabbar 2")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        rj_RootViewController.tabBarItem.selectedImage = UIImage(named: "tabbar 2_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        //4
        wz_RootViewController.tabBarItem.title = "用户"
        wz_RootViewController.tabBarItem.image = UIImage(named: "tabbar 3")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        wz_RootViewController.tabBarItem.selectedImage = UIImage(named: "tabbar 3_selected")?.imageWithRenderingMode(UIImageRenderingMode.AlwaysOriginal)
        
        self.viewControllers = [
            yxl2_ViewController,
            yxl_RootViewController,
            rj_RootViewController,
            wz_RootViewController
        ]
        
        self.selectedIndex = 0
    }
    

}
