//
//  YXL_ItemTableViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/15.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class YXL_ItemTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        MJREfresh
        self.tableView.header = MJRefreshNormalHeader(refreshingBlock: refreshHeader)
        self.tableView.footer = MJRefreshAutoNormalFooter (refreshingBlock: refreshFooter)
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 10
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("itemcell", forIndexPath: indexPath)

        cell.textLabel?.text = "杨晓磊是个大帅哥"
        // Configure the cell...

        return cell
    }
    
//   MARK: FuncTion
   private func refreshHeader(){
    self.tableView.header.lastUpdatedTimeKey = NSDate().description
        print("refreshHeader")
    self.tableView.header.endRefreshing()
    }
   private func refreshFooter(){
        print("refreshFooter")
    self.tableView.footer.endRefreshing()
    }

 

}
