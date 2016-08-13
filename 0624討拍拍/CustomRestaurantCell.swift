//
//  CustomRestaurantCell.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/4.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//


// 餐廳頁面的CustomCell

import UIKit
import CoreData

class CustomRestaurantCell: UITableViewCell {
    
    
    @IBOutlet var Title: UILabel!
    
    @IBOutlet var Content: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //初始Code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //Configure the view for the selected state
    }
    
    
}

