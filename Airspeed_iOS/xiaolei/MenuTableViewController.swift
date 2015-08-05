//
//  MenuTableViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/5.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit
import SideMenu
class MenuTableViewController: UITableViewController{
    
        var count = 10

    /**
    打开侧边菜单
    
    */
    @IBAction func Miss(sender: UIBarButtonItem) {
        toggleSideMenuView()
    }
    /**
    返回主页面

    */
    @IBAction func back(sender: UIBarButtonItem) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadDataAction()
    }

   

    // MARK: - Table view data source

   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        
        return count
    }

    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
     let cell =  self.tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath)
            
        cell.textLabel?.text = "\(indexPath.row)"
            
            return cell
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
    }
    
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?{
        
        
        let collectAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "收藏") { (action, indexpath) -> Void in
            
            
            //            在这里完成收藏物品的动作
            
        }
        
        
        return [collectAction]
        
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消cell的选中状态
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
  
    
    //    MARK: function
    
    
    /**
    刷新的动作
    */
    func loadDataAction(){
        //header 给当前tb的header属性
        self.tableView.header = MJRefreshNormalHeader(refreshingBlock: refreshHeader)
        // 上次刷新的时间
        tableView.header.lastUpdatedTimeKey = NSDate().description
        //开始执行刷新
        tableView.header.beginRefreshing()
       
    }
    
    /**
    刷新加载数据
    */
  private func refreshHeader(){
        print("刷新加载数据")
        count++
        self.tableView.reloadData()
        self.tableView.header.endRefreshing()
    }
    

}
