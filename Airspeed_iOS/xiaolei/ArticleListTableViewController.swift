//
//  ArticleListTableViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/3.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit


class ArticleListTableViewController: UITableViewController {
    
    
    var articleData = [ArticleDataSourceModel]()
    
    @IBOutlet weak var choose: UIBarButtonItem!
    
    @IBOutlet var tb: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()

        let  testData = ArticleDataSourceModel(name:"yangxiaolei",money:"99999")
        
        for _ in 0...50{
            articleData.append(testData)
        }
//        刷新
      loadDataAction()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
//    MARK: function
    
    
    /**
    刷新的动作
    */
    func loadDataAction(){
        //下拉刷新
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "refreshHeader")
        // 隐藏时间
        header.lastUpdatedTimeLabel!.hidden = true
        //开始执行刷新
//        header.beginRefreshing()
        //header 给当前tb的header属性
        self.tb.header = header
    }
    
    /**
    刷新加载数据
    */
    func refreshHeader(){
        print("刷新加载数据")
    }
    
    
    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return articleData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Article", forIndexPath: indexPath) as! ArticTableViewCell
        //cell 的默认样式
        cell.configCellWithStatusModel(StatusModel())
        // Configure the cell...

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

    /*
    // MARK: - NavigationY

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
