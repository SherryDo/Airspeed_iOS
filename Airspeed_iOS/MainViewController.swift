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
        yxl_RootViewController.tabBarItem.image = UIImage(named: "zuling")
        yxl_RootViewController.tabBarItem.selectedImage = UIImage(named: "zulingdown")
        //2
        yxl2_ViewController.tabBarItem.image = UIImage(named: "zuling")
        yxl2_ViewController.tabBarItem.selectedImage = UIImage(named: "zulingdown")
        //3
        rj_RootViewController.tabBarItem.title = "任杰"
        rj_RootViewController.tabBarItem.image = UIImage(named: "zuling")
        rj_RootViewController.tabBarItem.selectedImage = UIImage(named: "zulingdown")
        //4
        wz_RootViewController.tabBarItem.title = "王卓"
        wz_RootViewController.tabBarItem.image = UIImage(named: "zuling")
        wz_RootViewController.tabBarItem.selectedImage = UIImage(named: "zulingdown")
        
        self.viewControllers = [
            yxl_RootViewController,
            rj_RootViewController,
            wz_RootViewController,
            yxl2_ViewController
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
