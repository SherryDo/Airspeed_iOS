//
//  YXL_ItemTableViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/15.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class YXL_ItemTableViewController: UITableViewController,CNPGridMenuDelegate{
    
//    var gridMenu:CNPGridMenu?
    override func viewDidLoad() {
        super.viewDidLoad()
        //默认配置
        configController()
       
    }

    override func viewWillAppear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false
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
        
        cell.textLabel?.text = "杨晓磊是个大帅哥杨晓磊是个大帅哥杨晓磊是个大帅哥杨晓磊是个大帅哥杨晓磊是个大帅哥杨晓磊是个大帅哥杨晓磊是个大帅哥杨晓磊是个大帅哥杨晓磊是个大帅哥杨晓磊是个大帅哥"
        cell.selectionStyle = .None
        cell.textLabel?.numberOfLines = 0
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
        tableView.estimatedRowHeight = 44
        tableView.rowHeight = UITableViewAutomaticDimension
        //        MJREfresh
        self.tableView.header = MJRefreshNormalHeader(refreshingBlock: refreshHeader)
        self.tableView.footer = MJRefreshAutoNormalFooter (refreshingBlock: refreshFooter)
        
        tableView.tableFooterView = UIView(frame: CGRectZero)
        
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.item(self, action: "menuAction", image: "caiDan", HighImage: "caiDan_selected")
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style:
            .Plain, target: nil, action: nil)
        
    }
    
    func menuAction(){
        
        self.tabBarController?.tabBar.hidden = true
        
        var menuItemarray:[CNPGridMenuItem] = []
        //1
        let laterToday = CNPGridMenuItem()
        CNPGridMenuItem.initToMenuItem(laterToday, imageName: "LaterToday", title: "LaterToday") { (menuItem) -> Void in
            print(laterToday.title)
        }
        menuItemarray.append(laterToday)
        //2
        let thisEvening = CNPGridMenuItem()
        CNPGridMenuItem.initToMenuItem(thisEvening, imageName: "ThisEvening", title: "ThisEvening") { (MenuItem) -> Void in
            print("ThisEvening")
        }
        menuItemarray.append(thisEvening)
        //3
        let aaaa = CNPGridMenuItem()
        CNPGridMenuItem.initToMenuItem(aaaa, imageName: "aaaa", title: "aaaa") { (menuitem) -> Void in
            print("aaa")
        }
        menuItemarray.append(aaaa)
        //4
        let bbbb = CNPGridMenuItem()
        CNPGridMenuItem.initToMenuItem(bbbb, imageName: "bbbb", title: "bbbb") { (menuitem) -> Void in
            print("bbbb")
        }
        menuItemarray.append(bbbb)
        //5
        let ccc = CNPGridMenuItem()
        CNPGridMenuItem.initToMenuItem(ccc, imageName: "ccc", title: "ccc") { (menuitem) -> Void in
            print("ccc")
        }
        menuItemarray.append(ccc)
        
    
        
        let gridMenu = CNPGridMenu(menuItems: menuItemarray)
        gridMenu.blurEffectStyle = CNPBlurEffectStyle.Dark
        gridMenu.delegate = self
        presentGridMenu(gridMenu, animated: true) { () -> Void in
            print("gridMenu")
        }
    }
    
    
    
    
    
    
    //MARK : CNPGridMenuDelegate
    func gridMenuDidTapOnBackground(menu: CNPGridMenu!) {
         tabBarController?.tabBar.hidden = false
        self.dismissGridMenuAnimated(true) { () -> Void in
       
        }
    }
    
    func gridMenu(menu: CNPGridMenu!, didTapOnItem item: CNPGridMenuItem!) {
        tabBarController?.tabBar.hidden = false
        self.dismissGridMenuAnimated(true) { () -> Void in
        
        }
    }

}



extension CNPGridMenuItem{
    
    static func initToMenuItem (menuItem:CNPGridMenuItem,imageName:String,title:String,selectionHandler:SelectionHandler){
        menuItem.icon = UIImage(named: imageName)
        menuItem.title = title
        menuItem.selectionHandler = selectionHandler
    }
   
}


