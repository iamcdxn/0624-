//
//  CustomMenu2Cell.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/4.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

// 菜單頁面的CustomCell

import UIKit
import CoreData

class CustomMenu2Cell: UITableViewCell {
    
    @IBOutlet var Title: UILabel!
    @IBOutlet var Price: UILabel!
    
    override func awakeFromNib() {

        super.awakeFromNib()
        //初始Code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //Configure the view for the selected state
    }
    
    
}

