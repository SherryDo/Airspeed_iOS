//
//  YXL_InforMationViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/20.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class YXL_InforMationViewController: UIViewController,ENSideMenuDelegate{

    
    //MARK: IBAction
    @IBAction func goBack(sender: UIButton) {
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.hidden = true
        
        self.sideMenuController()?.sideMenu?.delegate = self
        // Do any additional setup after loading the view.
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
