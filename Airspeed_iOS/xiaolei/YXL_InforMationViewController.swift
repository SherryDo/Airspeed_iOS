//
//  YXL_InforMationViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/20.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit
/// 物品的详细信息类
class YXL_InforMationViewController: UIViewController,ENSideMenuDelegate{

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var toole: UIToolbar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBarController?.tabBar.hidden = true
        self.sideMenuController()?.sideMenu?.delegate = self
        // Do any additional setup after loading the view.
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style:
            .Plain, target: nil, action: nil)
      
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //MARK: ENSideMenuDelegate
   func sideMenuShouldOpenSideMenu () -> Bool{
    return false
    }

}
