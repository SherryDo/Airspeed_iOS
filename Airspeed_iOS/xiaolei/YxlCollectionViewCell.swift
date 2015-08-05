//
//  YxlCollectionViewCell.swift
//  Airspeed_iOS
//
//  Created by xiaolei on 15/8/3.
//  Copyright © 2015年 SherryTeam. All rights reserved.
//

import UIKit

class YxlCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var label: UILabel!
    
    @IBOutlet weak var image: UIImageView!
    
    
    func defaultCollectionData(collectiondata:CollectionDataSource){
        self.label.text = collectiondata.name
        self.image.image = UIImage(named: "background.jpg")
    }
    
}
