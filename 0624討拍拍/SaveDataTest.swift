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
import CoreData

class SaveDataTest: UIViewController {
   
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwdText: UITextField!
    @IBOutlet weak var loginBtn: UIButton!
    @IBOutlet weak var signUpBtn: UIButton!
    
    var ref: FIRDatabaseReference!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
     
        ref = FIRDatabase.database().reference()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //按任何地方收起鍵盤
        emailText.resignFirstResponder()
        passwdText.resignFirstResponder()

    }
    

    
    
    
    
}

