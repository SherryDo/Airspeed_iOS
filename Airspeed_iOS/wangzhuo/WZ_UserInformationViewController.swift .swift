//
//  WZ_UserInformationViewController.swift
//  Airspeed_iOS
//
//  Created by 王卓 on 15/8/3.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class WZ_UserInformationViewController:UIViewController {
    
    @IBOutlet weak var Navi: UINavigationItem!
    //用户头像
    @IBOutlet weak var userIcon: UIImageView!
    //背景
    @IBOutlet weak var userBackground: UIImageView!
    //用户名
    @IBOutlet weak var userNameLabel: UILabel!
    //用户地理位置
    @IBOutlet weak var locationLabel: UILabel!
    //用户交易次数
    @IBOutlet weak var countLabel: UILabel!
    //用户诚信度
    @IBOutlet weak var honestLevelLabel: UILabel!
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        userIcon.layer.cornerRadius=50
        userIcon.clipsToBounds=true
        
        
        //实例化模糊效果类，参数为风格
        let blurEffert=UIBlurEffect(style: UIBlurEffectStyle.ExtraLight)
        //实例化一个View
        let EffertView=UIVisualEffectView(effect: blurEffert)
        EffertView.alpha=0.65
        //设置view的大小
        EffertView.frame.size=CGSize(width: view.frame.width, height: view.frame.height)
        //加入视图
        userBackground.addSubview(EffertView)
        Navi.title="用户"
        
        
        
        

        
        // Do any additional setup after loading the view.
    }
    
    
    //返回按钮响应方法
    @IBAction func backButtonClicked(sender: UIBarButtonItem) {
        print("backButtonClicked has been called")
    }
    //编辑按钮响应方法
    @IBAction func editButtonClicked(sender: UIBarButtonItem) {
        print("editButtonClicked has been called")
    }
    
}
