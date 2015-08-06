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
    
    /// cell的信息存储
    var ArticArry = [ArticInformation]()
    var menueNumber = 0
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
        mjRefreshAction()
    }

 
   

    // MARK: - Table view data source

   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return ArticArry.count
    }

    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
     let cell =  self.tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath) as! MenuTableViewCell
            
        cell.name.text = ArticArry[indexPath.row].name
        cell.money.text = String(ArticArry[indexPath.row].money + 1)
        cell.imageView?.image = ArticArry[indexPath.row].imge!
        
            
            return cell
    }
    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {}
    
    // MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?{
        
        
        let collectAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "收藏",handler: CollectArtic)
        
        
        return [collectAction]
        
    }

    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        //取消cell的选中状态
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
        //侧边栏隐藏
        hideSideMenuView()
    }
  
    
    //    MARK: function
    
    /**
    cell收藏
    :param: action cell收藏
    */
    func CollectArtic(action:UITableViewRowAction,index:NSIndexPath){
        
    }
    
    /**
    刷新的属性配置
    */
    func mjRefreshAction(){
        //header 给当前tb的header属性
        self.tableView.header = MJRefreshNormalHeader(refreshingBlock: refreshHeader)
        //footer  给当前的tb的footer属性
        self.tableView.footer = MJRefreshAutoNormalFooter(refreshingBlock: refreshFooter)
    }
    
    /**
    * @auther 这块显卡有点冷
    ＊下拉刷新加载数据
    */
  private func refreshHeader(){
    //测试数据
    let newCell = ArticInformation(name: "Swift", money: 0)
    ArticArry.append(newCell)
    
    // 上次刷新的时间
    tableView.header.lastUpdatedTimeKey = NSDate().description
    
    self.tableView.reloadData()
    
    self.tableView.header.endRefreshing()
    }
   
    /**
    *  @author 这块显卡有点冷
    *
    *  上拉加载数据
    */
   private func refreshFooter(){
         print("上拉加载数据")
        tableView.footer.endRefreshing()
    }
    

}
