//
//  PickerViewControllerPlace.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/8/13.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//


import Foundation
import UIKit

class PickerViewControllerPlace: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var backBtn: UIButton!
    
    var receiveStringPlaceCity = ""
    var receiveStringPlaceDistrict = ""
    var receiveStringSeries = ""
    var receiveStringSeriesChild = ""
    var receiveStringPrice = ""
    var receiveStringTime = ""
    
    //首先先把要顯示的資料分別存在兩個Array
    
    var keyArray: [String] = ["基隆市","臺北市","新北市","桃園市","新竹市","新竹縣","苗栗縣","臺中市","彰化縣","南投縣","雲林縣","嘉義市","嘉義縣","臺南市","高雄市","屏東縣","臺東縣","花蓮縣","宜蘭縣","澎湖縣","金門縣","連江縣"]
    var makeIndex = 0
    var carDict : [String:[String]] = ["基隆市":["仁愛區","中正區","信義區","中山區","安樂區","暖暖區","七堵區"], "臺北市":["中正區","大同區","中山區","松山區","大安區","萬華區","信義區","士林區","北投區","內湖區","南港區","文山區"],"新北市":["板橋區","新莊區","中和區","永和區","土城區","樹林區","三峽區","鶯歌區","三重區","蘆洲區","五股區","泰山區","林口區","淡水區","金山區","八里區","萬里區","石門區","三芝區","瑞芳區","汐止區","平溪區","貢寮區","雙溪區","深坑區","石碇區","新店區","坪林區","烏來區"],"桃園市":["桃園區","中壢區","平鎮區","八德區","楊梅區","蘆竹區","大溪區","龍潭區","龜山區","大園區","觀音區","新屋區","復興區"],"新竹市":["東區","北區","香山區"],"新竹縣":["竹北市","竹東鎮","新埔鎮","關西鎮","湖口鄉","新豐鄉","峨眉鄉","寶山鄉","北埔鄉","芎林鄉","橫山鄉","尖石鄉","五峰鄉"],"苗栗縣":["苗栗市","頭份市","卓蘭鎮","竹南鎮","後龍鎮","通霄鎮","苑裡鎮","造橋鄉","西湖鄉","頭屋鄉","公館鄉","銅鑼鄉","三義鄉","大湖鄉","獅潭鄉","三灣鄉","南庄鄉","泰安鄉"],"臺中市":["中區","東區","南區","西區","北區","北屯區","西屯區","南屯區","太平區","大里區","霧峰區","烏日區","豐原區","后里區","石岡區","東勢區","和平區","新社區","潭子區","神岡區","大雅區","大肚區","沙鹿區","龍井區","梧棲區","清水區","大甲區","外埔區","大安區"],"彰化縣":["彰化市","員林市","和美鎮","鹿港鎮","溪湖鎮","二林鎮","田中鎮","北斗鎮","花壇鄉","芬園鄉","大村鄉","永靖鄉","伸港鄉","線西鄉","福興鄉","秀水鄉","埔心鄉","埔鹽鄉","大城鄉","芳苑鄉","竹塘鄉","社頭鄉","二水鄉","田尾鄉","埤頭鄉","溪州鄉"],"南投縣":["南投市","埔里鎮","草屯鎮","竹山鎮","集集鎮","名間鄉","鹿谷鄉","中寮鄉","魚池鄉","國姓鄉","水里鄉","信義鄉","仁愛鄉"],"雲林縣":["斗六市","斗南鎮","虎尾鎮","西螺鎮","土庫鎮","北港鎮","林內鄉","古坑鄉","大埤鄉","莿桐鄉","褒忠鄉","二崙鄉","崙背鄉","麥寮鄉","臺西鄉","東勢鄉","元長鄉","四湖鄉","口湖鄉","水林鄉"],"嘉義市":["東區","西區"],"嘉義縣":["太保市","朴子市","布袋鎮","大林鎮","民雄鄉","溪口鄉","新港鄉","六腳鄉","東石鄉","義竹鄉","鹿草鄉","水上鄉","中埔鄉","竹崎鄉","梅山鄉","番路鄉","大埔鄉","阿里山鄉"],"臺南市":["中西區","東區","南區","北區","安平區","安南區","永康區","歸仁區","新化區","左鎮區","玉井區","楠西區","南化區","仁德區","關廟區","龍崎區","官田區","麻豆區","佳里區","西港區","七股區","將軍區","學甲區","北門區","新營區","後壁區","白河區","東山區","六甲區","下營區","柳營區","鹽水區","善化區","大內區","山上區","新市區","安定區"],"高雄市":["楠梓區","左營區","鼓山區","三民區","鹽埕區","前金區","新興區","苓雅區","前鎮區","旗津區","小港區","鳳山區","大寮區","鳥松區","林園區","仁武區","大樹區","大社區","岡山區","路竹區","橋頭區","梓官區","彌陀區","永安區","燕巢區","田寮區","阿蓮區","茄萣區","湖內區","旗山區","美濃區","內門區","杉林區","甲仙區","六龜區","茂林區","桃源區","那瑪夏區"],"屏東縣":["屏東市","潮州鎮","東港鎮","恆春鎮","萬丹鄉","長治鄉","麟洛鄉","九如鄉","里港鄉","鹽埔鄉","高樹鄉","萬巒鄉","內埔鄉","竹田鄉","新埤鄉","枋寮鄉","新園鄉","崁頂鄉","林邊鄉","南州鄉","佳冬鄉","琉球鄉","車城鄉","滿州鄉","枋山鄉","霧臺鄉","瑪家鄉","泰武鄉","來義鄉","春日鄉","獅子鄉","牡丹鄉","三地門鄉"],"臺東縣":["臺東市","成功鎮","關山鎮","長濱鄉","池上鄉","東河鄉","鹿野鄉","卑南鄉","大武鄉","綠島鄉","太麻里鄉","海端鄉","延平鄉","金峰鄉","達仁鄉","蘭嶼鄉"],"花蓮縣":["花蓮市","鳳林鎮","玉里鎮","新城鄉","吉安鄉","壽豐鄉","光復鄉","豐濱鄉","瑞穗鄉","富里鄉","秀林鄉","萬榮鄉","卓溪鄉"],"宜蘭縣":["宜蘭市","頭城鎮","羅東鎮","蘇澳鎮","礁溪鄉","壯圍鄉","員山鄉","冬山鄉","五結鄉","三星鄉","大同鄉","南澳鄉"],"澎湖縣":["馬公市","湖西鄉","白沙鄉","西嶼鄉","望安鄉","七美鄉"],"金門縣":["金城鎮","金湖鎮","金沙鎮","金寧鄉","烈嶼鄉","烏坵鄉"],"連江縣":["南竿鄉","北竿鄉","莒光鄉","東引鄉"]]
    
    var WhatKey = "基隆市"
    var WhatDict = "仁愛區"
    
    
    
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
            var modelarray = carDict[keyArray[makeIndex]]
            WhatDict = modelarray![0]
            print (WhatKey)
        } else {
            var modelarray = carDict[keyArray[makeIndex]]
            WhatDict = modelarray![row]
            print (WhatDict)
        }
        
    }
    
    @IBAction func backBtnFunc(sender: AnyObject) {
        
        navigationController?.popViewControllerAnimated(true)
        
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        let secondVC: SearchViewController = segue.destinationViewController as! SearchViewController
        
        secondVC.receiveStringPlaceCity = "\(WhatKey)"
        secondVC.receiveStringPlaceDistrict = "\(WhatDict)"
        secondVC.receiveStringSeries = "\(receiveStringSeries)"
        secondVC.receiveStringSeriesChild = "\(receiveStringSeriesChild)"
        secondVC.receiveStringPrice = "\(receiveStringPrice)"
        secondVC.receiveStringTime = "\(receiveStringTime)"
        
    }
    
    
    
    
    
}
