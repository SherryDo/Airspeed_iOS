//
//  YXL_ViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/6/23.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

/// 本类是物品分类界面的控制器
class YXL_ViewController: UIViewController{

    
    
//   MARK: 属性
    /// cell的数据源
    var collectionData = [CollectionDataSource]()
    
    
//    MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        配置collectinView
        
        configCollection()
        
        
        
//        Alamofire.request(.GET, "http://httpbin.org/get")
        
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: IBAction
    
    
    
    /**
    返回首页
    
    */
    @IBAction func miss(sender: UIBarButtonItem) {
        
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
    
//   MARK: Function 
    
    
    
    /**
    配置collection的相关属性
    */
    func configCollection(){
        //collectionView的背景设置成白颜色
         self.collectionView.backgroundColor = UIColor.whiteColor()
        
        let testData = CollectionDataSource.defaultData
//        测试数据
        for _ in 0...20{
            
            collectionData.append(testData)
        }
        /**
        下拉刷新
        */
        loadDataAction()
    }
    
    
    
//    刷新加载的动作
    func loadDataAction(){
        
        let header = MJRefreshNormalHeader(refreshingTarget: self, refreshingAction: "refreshData")
        header.lastUpdatedTimeLabel?.hidden = true
//        header.beginRefreshing()
        self.collectionView.header = header
    }
//    刷新数据
    func refreshData(){
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
    
    
//    MARK: UICollectionViewDataSource
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{
        return collectionData.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier("yxlCell", forIndexPath: indexPath) as! YxlCollectionViewCell
        
        cell.defaultCollectionData(collectionData[indexPath.row])
        
        return cell
    }

}
