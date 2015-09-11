//
//  YXL_InforMationViewController.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/20.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit


/// 物品的详细信息类
class YXL_InforMationViewController: UIViewController,ENSideMenuDelegate{

    @IBOutlet weak var scroll: UIScrollView!
    @IBOutlet weak var toole: UIToolbar!



    override func viewDidLoad() {
        super.viewDidLoad()

        config()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //MARK: ENSideMenuDelegate
   func sideMenuShouldOpenSideMenu () -> Bool{
    return false
    }

    func config(){
        scroll.showsHorizontalScrollIndicator  = false
        scroll.contentSize                     = CGSize(width: self.view.bounds.size.width, height: self.view.bounds.size.height)
        tabBarController?.tabBar.hidden        = true
        //滚动图片的设置
        let imagesArray                        = [NSURL](count: 4, repeatedValue:NSURL(string: "http://7xlc1d.com1.z0.glb.clouddn.com/airZ.jpg")!)

        let cycleScrollview                    = SDCycleScrollView(frame: CGRectMake(0, 0, self.view.bounds.size.width, 180), imageURLsGroup: imagesArray)
      //自动滚动的时间
        cycleScrollview.autoScrollTimeInterval = 5.0
        scroll.addSubview(cycleScrollview)
    }


}
