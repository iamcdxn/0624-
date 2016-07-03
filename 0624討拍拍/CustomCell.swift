//
//  CustomCell.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/3.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    
    @IBOutlet var Name: UILabel!
    @IBOutlet var Service: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        //初始Code
    }
    
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        //Configure the view for the selected state
    }
    
    
}

