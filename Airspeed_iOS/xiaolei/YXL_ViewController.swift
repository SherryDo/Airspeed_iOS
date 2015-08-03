//
//  YXL_ViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/6/23.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class YXL_ViewController: UIViewController,UICollectionViewDataSource,UICollectionViewDelegate{

    
    
//   MARK: 属性
    var collectionData = [CollectionDataSource]()
    
    
//    MARK: IBOutlet
    @IBOutlet weak var collectionView: UICollectionView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        配置collectinView
        configCollection()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
//MARK: IBAction
    @IBAction func miss(sender: UIButton) {
        
         self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    
//   MARK: Function 
    /**
    配置collection的相关属性
    */
    func configCollection(){
        collectionView.backgroundColor = UIColor.whiteColor()
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
        
        
        cell.label.text = "\(indexPath.row)"
        
        return cell
    }

}
