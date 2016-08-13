//
//  PickerViewController4.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/6.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import Foundation

    import UIKit

class PickerViewControllerSeries: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var backBtn: UIButton!
    
    var receiveStringPlace = ""
    var receiveStringPlaceChild = ""
    var receiveStringSeries = ""
    var receiveStringSeriesChild = ""
    var receiveStringPrice = ""
    var receiveStringTime = ""
    
    //首先先把要顯示的資料分別存在兩個Array

    var keyArray: [String] = ["异国料理","咖啡馆","烧烤类","冰品饮料","火锅类"]
    var makeIndex = 0
    var carDict : [String :[String]] = ["异国料理" : ["日式料理","美式料理","泰式料理","印度料理"], "咖啡馆": ["咖啡专卖","复合式咖啡馆","甜点咖啡馆"],"烧烤类":["碳烤小摊","烧肉店","居酒屋"],"冰品饮料": ["茶饮果汁", "茶品类", "甜汤类"], "火锅类": ["麻辣锅","涮涮锅","小火锅"]]
    
    var WhatKey = "异国料理"
    var WhatDict = "日式料理"

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    //change the text color of UIPickerView with multiple components.
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        
        switch component {
        case 0:
            attributedString = NSAttributedString(string: keyArray[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        case 1:
            attributedString = NSAttributedString(string: carDict[keyArray[makeIndex]]![row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
            
        default:
            attributedString = nil
        }
        
        return attributedString
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 2   //有多少個 component
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //設定每個 component 有幾列
        if component == 0{
            return keyArray.count //第一個Component要顯示的數量
        }else{
            return carDict[keyArray[makeIndex]]!.count  //第二個Component要顯示的數量
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
   
        
        switch component {
            
        case 0:
            
            return keyArray[row]
            
        case 1:
            
            var modelarray = carDict[keyArray[makeIndex]]
            return modelarray![row]
            
        default:
            
            return "nothing"
        }
        
        
    }


    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 {
            makeIndex = row
            pickerView.reloadComponent(1)
            WhatKey = keyArray[row]
        } else {
            var modelarray = carDict[keyArray[makeIndex]]
            WhatDict = modelarray![row]
        }
        
    }
    
    @IBAction func backBtnFunc(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)

    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let secondVC: SearchViewController = segue.destinationViewController as! SearchViewController
        
        secondVC.receiveStringSeries = "\(WhatKey)"
        secondVC.receiveStringSeriesChild = "\(WhatDict)"
        secondVC.receiveStringPrice = "\(receiveStringPrice)"
        secondVC.receiveStringPlace = "\(receiveStringPlace)"
        secondVC.receiveStringPlaceChild = "\(receiveStringPlaceChild)"
        secondVC.receiveStringTime = "\(receiveStringTime)"
        
        
    }
    
    
    
    
    
}

