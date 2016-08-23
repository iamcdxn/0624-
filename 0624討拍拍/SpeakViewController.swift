//
//  FirstViewController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/6/24.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import Firebase
import CoreData

class SpeakViewController: UIViewController,UITextFieldDelegate, UIPickerViewDataSource, UIPickerViewDelegate {
    
    @IBOutlet weak var searchTextField: UITextField!
    @IBOutlet var SearchButton: UIButton!
    @IBOutlet weak var pickerTextField: UITextField!
    
    var buttonValue = Int()
    var pickOption = ["依店家名稱搜尋", "依地區搜尋", "依菜色搜尋"]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        SearchButton.layer.cornerRadius = 5
        
        let pickerView = UIPickerView()
        pickerView.delegate = self
        pickerTextField.inputView = pickerView
        
        let toolBar = UIToolbar(frame: CGRectMake(0, self.view.frame.size.height/6, self.view.frame.size.width, 40.0))
        
        toolBar.layer.position = CGPoint(x: self.view.frame.size.width/2, y: self.view.frame.size.height-20.0)
        
        toolBar.barStyle = UIBarStyle.BlackTranslucent
        toolBar.tintColor = UIColor.whiteColor()
        toolBar.backgroundColor = UIColor.blackColor()
        pickerTextField.text = "依店家名稱搜尋"
        
        let defaultButton = UIBarButtonItem(title: "Default", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(SpeakViewController.tappedToolBarBtn))
        
        let doneButton = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Done, target: self, action: #selector(SpeakViewController.donePressed))
        
        let flexSpace = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.FlexibleSpace, target: self, action: nil)
        
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: self.view.frame.size.width / 3, height: self.view.frame.size.height))
        
        label.font = UIFont(name: "Helvetica", size: 12)
        label.backgroundColor = UIColor.clearColor()
        label.textColor = UIColor.whiteColor()
        label.text = "搜尋選項"
        label.textAlignment = NSTextAlignment.Center
        
        let textBtn = UIBarButtonItem(customView: label)
        
        toolBar.setItems([defaultButton,flexSpace,textBtn,flexSpace,doneButton], animated: true)
        
        pickerTextField.inputAccessoryView = toolBar
        
    }
    
    // MARK: -- UIPickerViewDataSource
    func donePressed(sender: UIBarButtonItem) {
        pickerTextField.resignFirstResponder()
    }
    
    func tappedToolBarBtn(sender: UIBarButtonItem) {
        pickerTextField.text = "依店家名稱搜尋"
        pickerTextField.resignFirstResponder()
    }
    
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickOption.count
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickOption[row]
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        pickerTextField.text = pickOption[row]
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // Mark: - 鍵盤
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //按任何地方收起鍵盤
        searchTextField.resignFirstResponder()
        pickerTextField.endEditing(true)
    }
    
    // Mark: - 搜尋按鈕
    
    @IBAction func PressButton(sender: AnyObject) {
        if searchTextField.text! != "" {
            var sender = [String]()
            sender.append(searchTextField.text!)
            sender.append(pickerTextField.text!)
            performSegueWithIdentifier("toSearchResult", sender: sender)
        } else {
            let alert = UIAlertController(title: "Oops!", message: "請輸入關鍵字及搜尋選項", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toSearchResult" {
            if let searchResultontroller = segue.destinationViewController as? SearchResultController {
                let arr:[String] = sender as! [String]
                let query = arr[0]
                let filter = arr[1]
                
                var ftr = String()
                if filter == "依店家名稱搜尋" {
                    ftr = "0"
                } else if filter == "依地區搜尋" {
                    ftr = "1"
                } else if filter == "依菜色搜尋" {
                    ftr = "2"
                }
                searchResultontroller.query = query
                searchResultontroller.filter = ftr
            }
        }
    }
}

