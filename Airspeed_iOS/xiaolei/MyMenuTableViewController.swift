//
//  MyMenuTableViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/5.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit
/// 种类菜单栏的设置
class MyMenuTableViewController: UITableViewController {
    var selectedMenuItem : Int = 0// 当前是第几个菜单
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize apperance of table view
        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0) //
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        tableView.scrollsToTop = false
        
        // Preserve selection between presentations
        self.clearsSelectionOnViewWillAppear = false
    }

  

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 16
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
       
        
      var cell = tableView.dequeueReusableCellWithIdentifier("menuCell")
        
        
        if (cell == nil) {
            cell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "menuCell")
            cell!.backgroundColor = UIColor.yellowColor()
            cell!.textLabel?.textColor = UIColor.blueColor()
            let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, cell!.frame.size.width, cell!.frame.size.height))
            selectedBackgroundView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            cell!.selectedBackgroundView = selectedBackgroundView
        }
        
        cell!.textLabel?.text = "菜单\(indexPath.row+1)"

        return cell!
    }


    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        
        //取消cell的选中状态
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        if (indexPath.row == selectedMenuItem) {
            return
        }
        selectedMenuItem = indexPath.row
        
        //Present new view controller
        let mainStoryboard: UIStoryboard = UIStoryboard(name: "YXL_Storyboard",bundle: nil)
        let destViewController : MenuTableViewController
        switch (indexPath.row) {
        case 0:
            
            
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("YXLViewController1") as! MenuTableViewController
            
        case 1:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("YXLViewController1") as! MenuTableViewController
           
        case 2:
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("YXLViewController1") as! MenuTableViewController
            
        default:
            
            destViewController = mainStoryboard.instantiateViewControllerWithIdentifier("YXLViewController1") as! MenuTableViewController
        }
        
        destViewController.loadDataAction()
        sideMenuController()?.setContentViewController(destViewController)
        //        关掉侧边导航
        hideSideMenuView()
    }
    
    
    
}
