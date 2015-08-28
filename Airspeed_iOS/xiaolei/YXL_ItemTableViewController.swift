//
//  YXL_ItemTableViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/15.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit
import Pitaya
class YXL_ItemTableViewController: UITableViewController,CNPGridMenuDelegate{
    
//    var gridMenu:CNPGridMenu?
    override func viewDidLoad() {
        super.viewDidLoad()
        //默认配置
        configController()
        
        Pitaya.request(.GET, url: "http://pitayaswift.sinaapp.com/pitaya.php", errorCallback: nil) { (data, response) -> Void in
            
        }
        
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
        return 5
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

    func configController(){
        
        //        MJREfresh
        self.tableView.header = MJRefreshNormalHeader(refreshingBlock: refreshHeader)
        self.tableView.footer = MJRefreshAutoNormalFooter (refreshingBlock: refreshFooter)
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.item(self, action: "menuAction", image: "caiDan", HighImage: "caiDan_selected")
 
    }
    
    func menuAction(){
        
        let laterToday = CNPGridMenuItem()
        laterToday.icon = UIImage(named: "LaterToday")
        laterToday.title  = "LaterToday"
        laterToday.selectionHandler = {(CNPGridMenuItem) -> Void in
            print(laterToday.title)
        }
        
        
        let thisEvening = CNPGridMenuItem()
        thisEvening.icon = UIImage(named: "ThisEvening")
        thisEvening.title = "ThisEvening"
        thisEvening.selectionHandler = {(CNPGridMenuItem)->Void in
            print(thisEvening.title)
        }
        
        let gridMenu = CNPGridMenu(menuItems: [laterToday,thisEvening])
        gridMenu.blurEffectStyle = CNPBlurEffectStyle.Dark
        gridMenu.delegate = self
        presentGridMenu(gridMenu, animated: true) { () -> Void in
            print("gridMenu")
        }
    }
    
    
    
    
    
    
    //MARK : CNPGridMenuDelegate
    func gridMenuDidTapOnBackground(menu: CNPGridMenu!) {
        self.dismissGridMenuAnimated(true) { () -> Void in
            
        }
    }
    
    func gridMenu(menu: CNPGridMenu!, didTapOnItem item: CNPGridMenuItem!) {
        self.dismissGridMenuAnimated(true) { () -> Void in
            
        }
    }

}
