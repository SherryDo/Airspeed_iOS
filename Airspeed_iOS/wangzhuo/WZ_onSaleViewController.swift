//
//  WZ_onSaleViewController.swift
//  Airspeed_iOS
//
//  Created by 王卓 on 15/8/5.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class WZ_onSaleViewController: UIViewController,UITableViewDelegate,UITableViewDataSource{

    @IBOutlet weak var onSaleTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title="我的上架"
        //        MJREfresh
        self.onSaleTableView.header = MJRefreshNormalHeader(refreshingBlock: refreshHeader)
        self.onSaleTableView.footer = MJRefreshAutoNormalFooter (refreshingBlock: refreshFooter)
        
        onSaleTableView.dataSource=self
        onSaleTableView.delegate=self
        
        // Do any additional setup after loading the view.
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="onSaleTableViewCell"
        //注册xib
        onSaleTableView!.registerNib(UINib(nibName: "WZ_onSaleTableViewCell", bundle:nil), forCellReuseIdentifier: cellIdentifier)
        let cell=onSaleTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! WZ_onSaleTableViewCell
        
        cell.itemImage.image=UIImage(named: "icon.jpg")
        cell.itemName.text="itemName"
        cell.onSaleDate.text="onSaleDate"
        cell.itemCategory.text="itemCategory"
        
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return 10
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 97
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    //   MARK: FuncTion
    private func refreshHeader(){
        self.onSaleTableView.header.lastUpdatedTimeKey = NSDate().description
        print("refreshHeader")
        self.onSaleTableView.header.endRefreshing()
    }
    private func refreshFooter(){
        print("refreshFooter")
        self.onSaleTableView.footer.endRefreshing()
    }

}
