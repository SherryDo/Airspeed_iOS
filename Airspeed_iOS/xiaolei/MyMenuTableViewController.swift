//
//  MyMenuTableViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/5.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit
/// 种类菜单栏的设置
class MyMenuTableViewController: UITableViewController,ENSideMenuDelegate{
    var selectedMenuItem : Int = 0// 当前是第几个菜单
     //Present new view controller
    /// 取到 MenuTableViewController
    let destViewController  = UIStoryboard(name: "YXL_Storyboard", bundle: nil).instantiateViewControllerWithIdentifier("YXLViewController1") as! MenuTableViewController
    
    
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
        
       let cell = tableView.dequeueReusableCellWithIdentifier("menuCell")
       /// 判断cell是否存在
       let menueCell = configMenueCell(cell)
        
        return menueCell
    }


    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50.0
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        
        //取消cell的选中状态
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
//        if (indexPath.row == selectedMenuItem) {
//            如果选择的是现在的view的话就退出
//            return
//        }
        
        goMenuToRefresh(indexPath.row)
       
    }
    
//    MARK: function
    
    /**
    跳转到选择的菜单页面

    */
    func goMenuToRefresh(cellindex:Int){
        selectedMenuItem = cellindex
        //跳转到选择的界面
        sideMenuController()?.setContentViewController(destViewController)
        //        关掉侧边导航
        hideSideMenuView()
        //选择cell之后进行刷新界面的数据
        destViewController.tableView.header.beginRefreshing()
    }
    
    /**
    判断cell是否为nil如果为nil则生成一个cell
    */
    func configMenueCell(var menucell:UITableViewCell?) -> UITableViewCell{

        if (menucell == nil) {
            
            menucell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: "menuCell")
            
            menucell!.backgroundColor = UIColor.yellowColor()
            
            menucell!.textLabel?.textColor = UIColor.blueColor()
            
            let selectedBackgroundView = UIView(frame: CGRectMake(0, 0, menucell!.frame.size.width, menucell!.frame.size.height))
            
            selectedBackgroundView.backgroundColor = UIColor.grayColor().colorWithAlphaComponent(0.2)
            
            menucell!.selectedBackgroundView = selectedBackgroundView
        }
        
        MenueCellData(menucell!)
        
        
    return menucell!
    }
    
    /**
    *  @author 这块显卡有点冷
    *
    *  cell的内容填充
    */
    func  MenueCellData(cell:UITableViewCell){
        cell.textLabel?.text = "菜单"
    }
    
    
}
