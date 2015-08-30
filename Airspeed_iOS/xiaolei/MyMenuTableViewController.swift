//
//  MyMenuTableViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/5.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit
/// 种类菜单栏的设置
class MyMenuTableViewController: UITableViewController{
    var selectedMenuItem : Int = 0// 当前是第几个菜单
    
     //Present new view controller
    /// 取到 MenuTableViewController
    let  destViewController  = UIStoryboard(name: "YXL_Storyboard", bundle: nil).instantiateViewControllerWithIdentifier("YXLViewController1") as! MenuTableViewController
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Customize apperance of table view
//        tableView.contentInset = UIEdgeInsetsMake(64.0, 0, 0, 0) //
        tableView.separatorStyle = .None
        tableView.backgroundColor = UIColor.clearColor()
        tableView.backgroundView?.backgroundColor = UIColor.clearColor()
        tableView.scrollsToTop = false
        tableView.alpha = 1
        // Preserve selection between presentations
//        self.clearsSelectionOnViewWillAppear = false
        
//        tableView.selectRowAtIndexPath(NSIndexPath(forRow: selectedMenuItem, inSection: 0), animated: true, scrollPosition: .Middle)
        
    }

  

    // MARK: - Table view data source

 

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        var cell =  tableView.dequeueReusableCellWithIdentifier("CELL")
        
        if (cell == nil) {
            
            cell  = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "CELL")
            cell!.alpha = 0
        }
      
        
        return cell!
    }



    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){

        //取消cell的选中状态
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        selectedMenuItem = indexPath.row
        //跳转到选择的界面
        sideMenuController()?.setContentViewController(destViewController)
        //选择cell之后进行刷新界面的数据
//        destViewController.tableView.header.beginRefreshing()
        destViewController.loadListData(indexPath)
        //        关掉侧边导航
        hideSideMenuView()
    }
    


}
