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
    var simpleInfoArray:[ItemsSimpleInfo] = [];
    
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
//MARK: -TableView DataSource
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier="onSaleTableViewCell"
        let cell=onSaleTableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! WZ_onSaleTableViewCell
        
        cell.itemImage.image=simpleInfoArray[indexPath.row
        ].itemImage
        cell.itemName.text=simpleInfoArray[indexPath.row
            ].itemName
        cell.onSaleDate.text=simpleInfoArray[indexPath.row
            ].itemOnSaleDate
        cell.itemCategory.text=simpleInfoArray[indexPath.row
            ].itemCategory
        
        return cell
    }
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return simpleInfoArray.count
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
        let cell = ItemsSimpleInfo(name: "显然王卓更帅", category: "帅比", date: "2015.8.26")
        simpleInfoArray.append(cell)
        onSaleTableView.reloadData()
        self.onSaleTableView.header.endRefreshing()
    }
    private func refreshFooter(){
        print("refreshFooter")
        self.onSaleTableView.footer.endRefreshing()
    }

}
