//
//  FirstViewController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/8/8.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SaveDataTest: UIViewController {
   
    var ref: FIRDatabaseReference!
    
    @IBOutlet var NameTextField: UITextField!
    @IBOutlet var AddressTextField: UITextField!
    @IBOutlet var TelTextFIeld: UITextField!
    @IBOutlet var GoBtn: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        ref = FIRDatabase.database().reference()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func GoBtnPressed(sender: AnyObject) {
        
        let resName: String = NameTextField.text!
        let resAddress: String = AddressTextField.text!
        let resTel: String = TelTextFIeld.text!
        
        self.ref.child("restaurant").child(resName).setValue(["Address": resAddress, "Tel": resTel])
        
        
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //按任何地方收起鍵盤
        NameTextField.resignFirstResponder()
        AddressTextField.resignFirstResponder()
        TelTextFIeld.resignFirstResponder()


    }
    

    
    
    
    
}

