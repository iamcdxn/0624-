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

class SpeakViewController: UIViewController,UITextFieldDelegate {

    
    @IBOutlet var myTextField: UITextField!
    @IBOutlet var SearchButton: UIButton!
    
    
    

    
    var buttonValue = Int()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        

        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    
    
    
    
    
    // Mark: - 鍵盤
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //按任何地方收起鍵盤
        myTextField.resignFirstResponder()
    }
    
    @IBAction func TextFieldEditingDidChange(sender: AnyObject) {
        print("textField:" + "\(myTextField.text)")
        
        if validateEnter(myTextField.text!){
            self.buttonValue = 1
            
        }else  {
            
            self.buttonValue = 2
            
        }
        
        print(buttonValue)
        
        
    }


    func validateEnter(text: String) -> Bool{
        
        var result = false
        
        if text == "meat" {
            result = true
            
        }
        
        return result
        
        
    }
    
    
    
    // Mark: - 搜尋按鈕
    
    @IBAction func PressButton(sender: AnyObject) {
        
        if buttonValue == 1 {
        
            
            self.performSegueWithIdentifier("SpeakToSearchResult", sender: self)
        }else {
            
            
            self.performSegueWithIdentifier("SpeakToSearchResult", sender: self)
        }
        
        
    }

    
    
    
    
    
}

