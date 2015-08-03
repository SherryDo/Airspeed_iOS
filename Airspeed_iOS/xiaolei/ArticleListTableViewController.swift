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
    

    override func viewDidLoad() {
        super.viewDidLoad()

        let  testData = ArticleDataSourceModel(name:"yangxiaolei",money:"99999")
        
        for _ in 0...50{
            articleData.append(testData)
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
        return articleData.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Article", forIndexPath: indexPath) as! ArticTableViewCell

        
        cell.articName.text = articleData[indexPath.row].name
        cell.articMoney.text = articleData[indexPath.row].money
        
        
        // Configure the cell...

        return cell
    }
    

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {

    }
    

// MARK: - Table view delegate
    
    override func tableView(tableView: UITableView, editActionsForRowAtIndexPath indexPath: NSIndexPath) -> [UITableViewRowAction]?{
        
        
        let collectAction = UITableViewRowAction(style: UITableViewRowActionStyle.Default, title: "收藏") { (action, indexpath) -> Void in
            
        }
        
        
        return [collectAction]
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
