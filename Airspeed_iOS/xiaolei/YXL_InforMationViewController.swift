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
    
   lazy var images = [UIImage]()
   lazy var imageViews = [UIImageView?]()
   lazy var srcollSub = UIScrollView()
   lazy var pagecontro = UIPageControl()
    
   private let imageHeight = CGFloat(200)
   private var viewHeight = CGFloat(0)
    
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
    /**
    默认配置
    */
    func config(){
        //1
        tabBarController?.tabBar.hidden = true
        self.sideMenuController()?.sideMenu?.delegate = self
        navigationItem.backBarButtonItem = UIBarButtonItem(title: " ", style:.Plain, target: nil, action: nil)
        //2
        srcollSub.frame = CGRect(x: 0, y: 0, width: scroll.bounds.size.width, height: imageHeight)
        srcollSub.pagingEnabled = true
        srcollSub.showsVerticalScrollIndicator = false
        srcollSub.showsHorizontalScrollIndicator = false
        //3
        scroll.contentSize = CGSize(width:scroll.bounds.size.width, height: self.view.bounds.size.width)
        scroll.addSubview(srcollSub)
        pagecontro.center = srcollSub.center
        srcollSub.addSubview(pagecontro)
        
        loadIamges()
    }
    
    func loadIamges(){
        
        for i in 1...4{
            images.append(UIImage(named: "q\(i).png")!)
        }
        //设置 pagecontro 的数量
        let pageCount = images.count
        pagecontro.numberOfPages = pageCount
        pagecontro.currentPage = 0
        //初始化imageViews数量
        for _ in 0 ..< pageCount{
            imageViews.append(nil)
        }
        
        let  pagesScrollViewSize = scroll.frame.size
        
        srcollSub.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageCount), height: imageHeight)
        
        loadVisiblePages()
    }
    
    func loadVisiblePages(){
        
        let pageWidth = scroll.frame.size.width
        let pageNumber =  Int(floor((srcollSub.contentOffset.x * 2.0 + pageWidth) / (pageWidth * 2.0)))
        
        pagecontro.currentPage = pageNumber
        
        let firstPage = pageNumber - 1
        let lastPage = pageNumber + 1
        
        for var index = 0 ; index < firstPage; ++index{
            purgePage(index)
        }
        
        for index in firstPage...lastPage{
            loadPage(index)
        }
        
        for var index = lastPage + 1; index < imageViews.count; ++index{
            purgePage(index)
        }
    }
    
    func loadPage(index:Int){
        if index < 0 || index >= images.count{
            //如果超出了显示的范围什么也不做
            return
        }
        if let _ = imageViews[index]{
            //页面已经加载，不需要额外操作
        }else{
            var frame = srcollSub.bounds
            frame.origin.x = frame.width * CGFloat(index)
            frame.origin.y = 0.0
            
            let newPageView = UIImageView(image: images[index])
            newPageView.contentMode = .ScaleAspectFit
            newPageView.frame = srcollSub.bounds
            srcollSub.addSubview(newPageView)
            
            imageViews[index] = newPageView
        }
    }
    
    func purgePage(index:Int){
        if index < 0 || index >= images.count{
            return
        }
        if let pageView = imageViews[index]{
            pageView.removeFromSuperview()
            imageViews[index] = nil
        }
    }
    
    func scrollViewDidScroll(scrollView:UIScrollView){
        loadVisiblePages()
    }

}
