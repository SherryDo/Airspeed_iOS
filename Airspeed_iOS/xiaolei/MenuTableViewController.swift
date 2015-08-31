//
//  MenuTableViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/5.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit
/// 同城物品列表
class MenuTableViewController: UITableViewController{
    
    /// cell的信息存储
    var ArticArry = [ArticInformation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // MJRefresh
        mjRefreshAction()
        navgationleftButtonAction()
        //测试数据
        let newCell = ArticInformation(name: "杨晓磊", money: 1.1, imageurl: "http://7xlc1d.com1.z0.glb.clouddn.com/airZ.jpg")
        for _ in 0...6{
            ArticArry.append(newCell)
        }
        
       
    }
   
    override func viewWillAppear(animated: Bool){
        tabBarController?.tabBar.hidden = false
        
    }
   
    

    // MARK: - Table view data source

   
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       
        return ArticArry.count
    }

    override func tableView(tableView: UITableView,
        cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
     
            let cell =  tableView.dequeueReusableCellWithIdentifier("ListCell", forIndexPath: indexPath) as! MenuTableViewCell
            
        cell.name.text = ArticArry[indexPath.row].name
        cell.money.text = String(ArticArry[indexPath.row].money + 1)
//        cell.imageView?.image = ArticArry[indexPath.row].imge!
            
        cell.imageview.sd_setImageWithURL(ArticArry[indexPath.row].imgeURL!, placeholderImage:UIImage(named: "icon.jpg"))
        
            
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
    打开侧边菜单/关闭侧边栏
    
    */
    
    func navgationleftButtonAction(){
        //        let leftBtton =
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.item(self, action: "sideMenuView:", image: "caiDan", HighImage: "caiDan_selected")
    
        tableView.tableFooterView = UIView(frame: CGRectZero)
    }
    //隐藏和显示侧边栏
    func sideMenuView(bt:UIBarButtonItem){
        self.toggleSideMenuView()
    }
    
    /**
    cell收藏
    :param: action cell收藏
    */
    func CollectArtic(action:UITableViewRowAction,index:NSIndexPath){
        
    }
    
    /**
    刷新的属性配置
    */
 private func mjRefreshAction(){
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
    let newCell = ArticInformation(name: "杨晓磊", money: 1.1, imageurl: "http://7xlc1d.com1.z0.glb.clouddn.com/airZ.jpg")
    ArticArry.append(newCell)
    // 上次刷新的时间
    tableView.header.lastUpdatedTimeKey = NSDate().description
    //刷新界面
    self.tableView.reloadData()
    //停止刷新
    self.tableView.header.endRefreshing()
    }
   
    /**
    *  @author 这块显卡有点冷
    *
    *  上拉加载数据
    */
   private func refreshFooter(){
    //测试数据
        let newCell = ArticInformation(name: "杨晓磊", money: 0.0, imageurl: "http://7xlc1d.com1.z0.glb.clouddn.com/airZ.jpg")
        ArticArry.append(newCell)
    //刷新界面
        tableView.reloadData()
    //停止加载数据
        tableView.footer.endRefreshing()
    }
    
    /**
    根据选index来获取数据
    */
    func loadListData(index:NSIndexPath){
        print(index.row)
        tableView.header.beginRefreshing()
    }
    
    
  
}



