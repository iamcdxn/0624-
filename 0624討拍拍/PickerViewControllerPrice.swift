//
//  PickerViewController3.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/6.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import Foundation

import UIKit

class PickerViewControllerPrice: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet var backBtn: UIButton!
    
    var receiveStringPlaceCity = ""
    var receiveStringPlaceDistrict = ""
    var receiveStringSeries = ""
    var receiveStringSeriesChild = ""
    var receiveStringPrice = ""
    var receiveStringTime = ""
    
    
    //首先先把要顯示的資料分別存在兩個Array
    let numberArray = ["頂級價位 2000元以上","高價位 1400-1999元","中高價位 800-1399元","中價位 400-799元","中低價位 200-399元","平價 1-200元/每人"]
    let fruitArray = ["咖啡专卖","复合式咖啡馆","甜点咖啡馆"]
    var whatNum = "頂級價位 2000元以上"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

    //change the text color of UIPickerView with multiple components.
    
    func pickerView(pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        var attributedString: NSAttributedString!
        
        switch component {
        case 0:
            attributedString = NSAttributedString(string: numberArray[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])
        case 1:
            attributedString = NSAttributedString(string: fruitArray[row], attributes: [NSForegroundColorAttributeName : UIColor.whiteColor()])

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
        return 1   //有多少個 component
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        //設定每個 component 有幾列
        if component == 0{
            return numberArray.count //第一個Component要顯示的數量
        }else{
            return fruitArray.count  //第二個Component要顯示的數量
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0{
            return numberArray[row]  //第一個Component要顯示的文字
        }else{
            return fruitArray[row]   //第二個Component要顯示的文字
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0{
            print("number: \(numberArray[row])") //點擊第一個Component
            whatNum = numberArray[row]
            
        }else{
            print("fruit: \(fruitArray[row])")   //點擊第二個Component
        }
    
    }
    
    
    @IBAction func backBtnFunc(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        
        let secondVC: SearchViewController = segue.destinationViewController as! SearchViewController
        
        secondVC.receiveStringPrice = "\(whatNum)"
        secondVC.receiveStringSeries = "\(receiveStringSeries)"
        secondVC.receiveStringSeriesChild = "\(receiveStringSeriesChild)"
        secondVC.receiveStringPlaceCity = "\(receiveStringPlaceCity)"
        secondVC.receiveStringPlaceDistrict = "\(receiveStringPlaceDistrict)"
        secondVC.receiveStringTime = "\(receiveStringTime)"
        
        
    }
    
    
    
    
    
    
}

