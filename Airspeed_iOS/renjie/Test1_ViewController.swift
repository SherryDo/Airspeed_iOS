//
//  Test1ViewController.swift
//  Airspeed_iOS
//
//  Created by 仇寻 on 15/8/5.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class Test1_ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource{
    
    
    @IBOutlet weak var Sj_tableView: UITableView!
    @IBOutlet weak var tCButton: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "RjTableViewCell", bundle: nil)
        self.Sj_tableView.registerNib(nib, forCellReuseIdentifier: "reCellID")
        Sj_tableView.rowHeight = 70
        tCButton.layer.cornerRadius = 8
        tCButton.layer.masksToBounds = true

    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("reCellID", forIndexPath: indexPath) as? RjTableViewCell
        return cell!
    }

}
