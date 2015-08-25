//
//  ScrollViewController.swift
//  Airspeed_iOS
//
//  Created by 仇寻 on 15/8/25.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class ScrollViewController: UIViewController,UIScrollViewDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        ScrollView.frame = self.view.bounds
        self.view.addSubview(ScrollView)
        let width = self.view.frame.width
        let height = self.view.frame.height
        for var i = 0;i < 4;i++ {
            let imageN:String = String(format: "ScrollView％d",i+1)
            let image:UIImage = UIImage(named: imageN)!
            let imageView = UIImageView(frame: CGRectMake(0, 0, width, height))
            imageView.image = image
            var frame:CGRect = imageView.frame
            frame.origin.x = CGFloat(i) * frame.size.width
            imageView.frame = frame
            ScrollView.addSubview(imageView)
        }
        ScrollView.contentSize = CGSizeMake(4 * self.view.frame.width, 0)
        ScrollView.bounces = false
        ScrollView.showsHorizontalScrollIndicator = false
        ScrollView.pagingEnabled = true
        ScrollView.showsHorizontalScrollIndicator = false
        ScrollView.delegate = self
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var ScrollView = UIScrollView()
    var pageController = UIPageControl()

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
