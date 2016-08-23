//
//  SecondViewController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/6/24.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var placeTextField: UITextField!
    @IBOutlet weak var seriesTextField: UITextField!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBOutlet weak var searchBtn: UIButton!
    
    var placePickOption1:[String] = ["基隆市","臺北市","新北市","桃園市","新竹市","新竹縣","苗栗縣","臺中市","彰化縣","南投縣","雲林縣","嘉義市","嘉義縣","臺南市","高雄市","屏東縣","臺東縣","花蓮縣","宜蘭縣","澎湖縣","金門縣","連江縣"]
    
    var placePickOption2:[String:[String]] = ["基隆市":["仁愛區","中正區","信義區","中山區","安樂區","暖暖區","七堵區"], "臺北市":["中正區","大同區","中山區","松山區","大安區","萬華區","信義區","士林區","北投區","內湖區","南港區","文山區"],"新北市":["板橋區","新莊區","中和區","永和區","土城區","樹林區","三峽區","鶯歌區","三重區","蘆洲區","五股區","泰山區","林口區","淡水區","金山區","八里區","萬里區","石門區","三芝區","瑞芳區","汐止區","平溪區","貢寮區","雙溪區","深坑區","石碇區","新店區","坪林區","烏來區"],"桃園市":["桃園區","中壢區","平鎮區","八德區","楊梅區","蘆竹區","大溪區","龍潭區","龜山區","大園區","觀音區","新屋區","復興區"],"新竹市":["東區","北區","香山區"],"新竹縣":["竹北市","竹東鎮","新埔鎮","關西鎮","湖口鄉","新豐鄉","峨眉鄉","寶山鄉","北埔鄉","芎林鄉","橫山鄉","尖石鄉","五峰鄉"],"苗栗縣":["苗栗市","頭份市","卓蘭鎮","竹南鎮","後龍鎮","通霄鎮","苑裡鎮","造橋鄉","西湖鄉","頭屋鄉","公館鄉","銅鑼鄉","三義鄉","大湖鄉","獅潭鄉","三灣鄉","南庄鄉","泰安鄉"],"臺中市":["中區","東區","南區","西區","北區","北屯區","西屯區","南屯區","太平區","大里區","霧峰區","烏日區","豐原區","后里區","石岡區","東勢區","和平區","新社區","潭子區","神岡區","大雅區","大肚區","沙鹿區","龍井區","梧棲區","清水區","大甲區","外埔區","大安區"],"彰化縣":["彰化市","員林市","和美鎮","鹿港鎮","溪湖鎮","二林鎮","田中鎮","北斗鎮","花壇鄉","芬園鄉","大村鄉","永靖鄉","伸港鄉","線西鄉","福興鄉","秀水鄉","埔心鄉","埔鹽鄉","大城鄉","芳苑鄉","竹塘鄉","社頭鄉","二水鄉","田尾鄉","埤頭鄉","溪州鄉"],"南投縣":["南投市","埔里鎮","草屯鎮","竹山鎮","集集鎮","名間鄉","鹿谷鄉","中寮鄉","魚池鄉","國姓鄉","水里鄉","信義鄉","仁愛鄉"],"雲林縣":["斗六市","斗南鎮","虎尾鎮","西螺鎮","土庫鎮","北港鎮","林內鄉","古坑鄉","大埤鄉","莿桐鄉","褒忠鄉","二崙鄉","崙背鄉","麥寮鄉","臺西鄉","東勢鄉","元長鄉","四湖鄉","口湖鄉","水林鄉"],"嘉義市":["東區","西區"],"嘉義縣":["太保市","朴子市","布袋鎮","大林鎮","民雄鄉","溪口鄉","新港鄉","六腳鄉","東石鄉","義竹鄉","鹿草鄉","水上鄉","中埔鄉","竹崎鄉","梅山鄉","番路鄉","大埔鄉","阿里山鄉"],"臺南市":["中西區","東區","南區","北區","安平區","安南區","永康區","歸仁區","新化區","左鎮區","玉井區","楠西區","南化區","仁德區","關廟區","龍崎區","官田區","麻豆區","佳里區","西港區","七股區","將軍區","學甲區","北門區","新營區","後壁區","白河區","東山區","六甲區","下營區","柳營區","鹽水區","善化區","大內區","山上區","新市區","安定區"],"高雄市":["楠梓區","左營區","鼓山區","三民區","鹽埕區","前金區","新興區","苓雅區","前鎮區","旗津區","小港區","鳳山區","大寮區","鳥松區","林園區","仁武區","大樹區","大社區","岡山區","路竹區","橋頭區","梓官區","彌陀區","永安區","燕巢區","田寮區","阿蓮區","茄萣區","湖內區","旗山區","美濃區","內門區","杉林區","甲仙區","六龜區","茂林區","桃源區","那瑪夏區"],"屏東縣":["屏東市","潮州鎮","東港鎮","恆春鎮","萬丹鄉","長治鄉","麟洛鄉","九如鄉","里港鄉","鹽埔鄉","高樹鄉","萬巒鄉","內埔鄉","竹田鄉","新埤鄉","枋寮鄉","新園鄉","崁頂鄉","林邊鄉","南州鄉","佳冬鄉","琉球鄉","車城鄉","滿州鄉","枋山鄉","霧臺鄉","瑪家鄉","泰武鄉","來義鄉","春日鄉","獅子鄉","牡丹鄉","三地門鄉"],"臺東縣":["臺東市","成功鎮","關山鎮","長濱鄉","池上鄉","東河鄉","鹿野鄉","卑南鄉","大武鄉","綠島鄉","太麻里鄉","海端鄉","延平鄉","金峰鄉","達仁鄉","蘭嶼鄉"],"花蓮縣":["花蓮市","鳳林鎮","玉里鎮","新城鄉","吉安鄉","壽豐鄉","光復鄉","豐濱鄉","瑞穗鄉","富里鄉","秀林鄉","萬榮鄉","卓溪鄉"],"宜蘭縣":["宜蘭市","頭城鎮","羅東鎮","蘇澳鎮","礁溪鄉","壯圍鄉","員山鄉","冬山鄉","五結鄉","三星鄉","大同鄉","南澳鄉"],"澎湖縣":["馬公市","湖西鄉","白沙鄉","西嶼鄉","望安鄉","七美鄉"],"金門縣":["金城鎮","金湖鎮","金沙鎮","金寧鄉","烈嶼鄉","烏坵鄉"],"連江縣":["南竿鄉","北竿鄉","莒光鄉","東引鄉"]]
    
    var seriesPickOption1:[String] = ["异国料理","咖啡馆","烧烤类","冰品饮料","火锅类"]
    var seriesPickOption2:[String:[String]] = ["异国料理" : ["日式料理","美式料理","泰式料理","印度料理"], "咖啡馆": ["咖啡专卖","复合式咖啡馆","甜点咖啡馆"],"烧烤类":["碳烤小摊","烧肉店","居酒屋"],"冰品饮料": ["茶饮果汁", "茶品类", "甜汤类"], "火锅类": ["麻辣锅","涮涮锅","小火锅"]]
    
    var pricePickOption:[String] = ["頂級價位 2000元以上", "高價位 1400-1999元", "中高價位 800-1399元", "中價位 400-799元", "中低價位 200-399元", "平價 1-200元/每人"]
    
    var timePickOption:[String] = ["早餐", "早午餐", "午餐", "下午茶", "晚餐", "宵夜"]
    
    var makeIndex1 = 0
    var makeIndex2 = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        searchBtn.layer.cornerRadius = 5
        
        let placePickerView = UIPickerView()
        let seriesPickerView = UIPickerView()
        let pricePickerView = UIPickerView()
        let timePickerView = UIPickerView()
        
        placePickerView.delegate = self
        seriesPickerView.delegate = self
        pricePickerView.delegate = self
        timePickerView.delegate = self
        
        placePickerView.tag = 0
        seriesPickerView.tag = 1
        pricePickerView.tag = 2
        timePickerView.tag = 3
        
        placeTextField.inputView = placePickerView
        seriesTextField.inputView = seriesPickerView
        priceTextField.inputView = pricePickerView
        timeTextField.inputView = timePickerView
        
        placeTextField.attributedPlaceholder = NSAttributedString(string:"我附近",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        seriesTextField.attributedPlaceholder = NSAttributedString(string:"请选择",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        priceTextField.attributedPlaceholder = NSAttributedString(string:"请选择",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        timeTextField.attributedPlaceholder = NSAttributedString(string:"请选择",attributes:[NSForegroundColorAttributeName: UIColor.whiteColor()])
        
        let toolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.BlackTranslucent
        toolBar.tintColor = UIColor.whiteColor()
        toolBar.backgroundColor = UIColor.blackColor()
        
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(SpeakViewController.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.whiteColor()
        label.text = "條件選項"
        label.textAlignment = NSTextAlignment.Center
        
        let textBtn = UIBarButtonItem(customView: label)
        
        toolBar.setItems([flexSpace,textBtn,flexSpace,doneButton], animated: true)
        
        placeTextField.inputAccessoryView = toolBar
        seriesTextField.inputAccessoryView = toolBar
        priceTextField.inputAccessoryView = toolBar
        timeTextField.inputAccessoryView = toolBar
    }
    
    // MARK: -- UIPickerViewDataSource
    func donePressed(sender: UIBarButtonItem) {
        placeTextField.resignFirstResponder()
        seriesTextField.resignFirstResponder()
        priceTextField.resignFirstResponder()
        timeTextField.resignFirstResponder()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        if pickerView.tag == 0 {
            return 2
        } else if pickerView.tag == 1 {
            return 2
        } else if pickerView.tag == 2 {
            return 1
        } else if pickerView.tag == 3 {
            return 1
        }
        
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView.tag == 0 {
            if component == 0 {
                return placePickOption1.count
            } else {
                return placePickOption2[placePickOption1[makeIndex1]]!.count
            }
        } else if pickerView.tag == 1 {
            if component == 0 {
                return seriesPickOption1.count
            } else {
                return seriesPickOption2[seriesPickOption1[makeIndex2]]!.count
            }
        } else if pickerView.tag == 2 {
            return pricePickOption.count
        } else if pickerView.tag == 3 {
            return timePickOption.count
        }
        
        return 0
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView.tag == 0 {
            if component == 0 {
                return placePickOption1[row]
            } else {
                let arr = placePickOption2[placePickOption1[makeIndex1]]
                return arr![row]
            }
        } else if pickerView.tag == 1 {
            if component == 0 {
                return seriesPickOption1[row]
            } else {
                let arr = seriesPickOption2[seriesPickOption1[makeIndex2]]
                return arr![row]
            }
        } else if pickerView.tag == 2 {
            return pricePickOption[row]
        } else if pickerView.tag == 3 {
            return timePickOption[row]
        }
        
        return "none"
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView.tag == 0 {
            var text = ""
            if component == 0 {
                makeIndex1 = row
                text += placePickOption1[makeIndex1]
                pickerView.reloadComponent(1)
            }
            if component == 1 {
                text += placePickOption1[makeIndex1]
                let arr = placePickOption2[placePickOption1[makeIndex1]]
                text += " \(arr![row])"
            }
            placeTextField.text = text
            
        } else if pickerView.tag == 1 {
            var text = ""
            if component == 0 {
                makeIndex2 = row
                text += seriesPickOption1[makeIndex2]
                pickerView.reloadComponent(1)
            }
            if component == 1 {
                text += seriesPickOption1[makeIndex2]
                let arr = seriesPickOption2[seriesPickOption1[makeIndex2]]
                text += " \(arr![row])"
            }
            seriesTextField.text = text
            
        } else if pickerView.tag == 2 {
            priceTextField.text = pricePickOption[row]
        } else if pickerView.tag == 3 {
            timeTextField.text = timePickOption[row]
        }
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        placeTextField.endEditing(true)
        seriesTextField.endEditing(true)
        priceTextField.endEditing(true)
        timeTextField.endEditing(true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "toResult" {
            if let secondVC = segue.destinationViewController as? SearchResult2Controller {
                
                let place = placeTextField.text!
                var placeArr = place.characters.split{$0 == " "}.map(String.init)
                
                if (placeArr.count == 1) {
                    secondVC.receiveStringPlaceCity = placeArr[0]
                    secondVC.receiveStringPlaceDistrict = ""
                } else if (placeArr.count == 2) {
                    secondVC.receiveStringPlaceCity = placeArr[0]
                    secondVC.receiveStringPlaceDistrict = placeArr[1]
                } else {
                    secondVC.receiveStringPlaceCity = ""
                    secondVC.receiveStringPlaceDistrict = ""
                }
                secondVC.receiveStringTime = timeTextField.text!
                secondVC.receiveStringPrice = priceTextField.text!
                secondVC.receiveStringSeries = seriesTextField.text!
            }
        }
    }
    
    @IBAction func Search(sender: AnyObject) {
        performSegueWithIdentifier("toResult", sender: "")
    }
    
    
}
    
    

    
    
    
    
    



