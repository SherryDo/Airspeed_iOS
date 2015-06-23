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

        
        loadAllViewController()
        
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
    
    
//    MARK: - Function
    
    func loadAllViewController(){
//        这个函数是用来加载其他故事版的根视图的
        
        
//        获取 YXL_Storyboard的信息。并且把根视图返回。
        let yxl_ViewController = UIStoryboard(name: "YXL_Storyboard", bundle: nil).instantiateInitialViewController() as! YXL_ViewController
//         设置其在Tab bar上的文字。(将来图片也在这里设置，现在只设置文字就好)
//        我这里暂时设置的是“YXL”，之后根据需要会更改
         yxl_ViewController.tabBarItem.title = "YXL"
        
        
        
        
        
//        把你们的根视图控制的代码放在这里。
        
        
        
        
        
        
//        创建一个视图控制器组,把你们的视图控制器添加在这个数组里就好。
        let tabBarViewControlelrs = [
            yxl_ViewController
        ]
        
//        给当前的TabBar选项卡添加控制项目
        self.setViewControllers(tabBarViewControlelrs, animated: true)
        
//        选项卡启动时默认选择第一个
        self.selectedIndex = 1
        
        
    }

}
