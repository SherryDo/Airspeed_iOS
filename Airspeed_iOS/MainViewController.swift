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
//        获取每个故事版的根视图控制器
        let yxl_RootViewController = UIStoryboard(name: "YXL_Storyboard", bundle: nil).instantiateInitialViewController() as! MyNavigationViewController
        
        let rj_RootViewController = UIStoryboard(name: "rj_Storyboard", bundle: nil).instantiateInitialViewController() as! UINavigationController
        
        let wz_RootViewController = UIStoryboard(name: "WZ_StoryBoard", bundle: nil).instantiateInitialViewController() as! WZ_UserInformationViewController
        
        let yxl2_ViewController = UIStoryboard(name: "YXL2_Storyboard", bundle: nil).instantiateInitialViewController() as! UINavigationController
        
        
//        设置 tabBarItem的一些属性
        //1
        yxl_RootViewController.tabBarItem.title = "租赁"
        yxl_RootViewController.tabBarItem.image = UIImage(named: "tabbar 1")
        yxl_RootViewController.tabBarItem.selectedImage = UIImage(named: "tabbar 1_choosed")
        //2
        yxl2_ViewController.tabBarItem.image = UIImage(named: "tabbar 4")
        yxl2_ViewController.tabBarItem.selectedImage = UIImage(named: "tabbar 4")
        //3
        rj_RootViewController.tabBarItem.title = "上架"
        rj_RootViewController.tabBarItem.image = UIImage(named: "tabbar 2")
        rj_RootViewController.tabBarItem.selectedImage = UIImage(named: "tabbar 2_choosed")
        //4
        wz_RootViewController.tabBarItem.title = "用户"
        wz_RootViewController.tabBarItem.image = UIImage(named: "tabbar 3")
        wz_RootViewController.tabBarItem.selectedImage = UIImage(named: "tabbar 3_choosed")
        
        self.viewControllers = [
            yxl2_ViewController,
            yxl_RootViewController,
            rj_RootViewController,
            wz_RootViewController
        ]
        
        self.selectedIndex = 0
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    


}
