//
//  rj_gnsjViewController.swift
//  Airspeed_iOS
//
//  Created by 仇寻 on 15/8/7.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class rj_gnsjViewController: UIViewController,UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        photoC.layer.borderWidth = 0.5
        photoC.layer.borderColor = UIColor(red: 0.223, green: 0.345, blue: 0.856, alpha: 0.3).CGColor
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
   
    @IBOutlet weak var photoC: UIImageView!
    
    func photoCTab(){
        
    }
        


}