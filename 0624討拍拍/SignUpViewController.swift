//
//  SignUpViewController.swift
//  0624討拍拍
//
//  Created by 楊喬宇 on 2016/8/22.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseAuth
import FirebaseDatabase

class SignUpViewController: UIViewController {

    @IBOutlet weak var usrNameText: UITextField!
    @IBOutlet weak var emailText: UITextField!
    @IBOutlet weak var passwdText: UITextField!
    @IBOutlet weak var okBtn: NSLayoutConstraint!
    @IBOutlet weak var cancelBtn: UIButton!
    
    var ref:FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        FIRApp.configure()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        ref = FIRDatabase.database().reference()
    }
    
    @IBAction func ok(sender: AnyObject) {
        /*let username = usrNameText.text
        let email = emailText.text
        let password = passwdText.text

        if username != "" && email != "" && password != "" {
            // Set Email and Password for the New User.
            FIRAuth.auth()?.createUserWithEmail(email!, password: password!, completion: { error, result in
                if error != nil {
                    
                    // There was a problem.
                    let alert = UIAlertController(title: "Oops!", message: "註冊您的帳號時發生一些問題，請再試一次。", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                    self.presentViewController(alert, animated: true, completion: nil)
                    
                } else {
                    
                    // Create and Login the New User with authUser
                    FIRAuth.auth()?.signInWithEmail(email!, password: password!, completion: { err, authData in
                        FIRAuth.auth()?.
                        DataService.dataService.createNewAccount(authData.uid, user: user)
                    })
                    
                    // Store the uid for future access - handy!
                    NSUserDefaults.standardUserDefaults().setValue(result ["uid"], forKey: "uid")
                    
                    // Enter the app.
                    self.performSegueWithIdentifier("NewUserLoggedIn", sender: nil)
                }
            })
            
        } else {
            let alert = UIAlertController(title: "Oops!", message: "用戶名、電子信箱及密碼為必填項目。", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        }*/
    }

    @IBAction func Cancel(sender: AnyObject) {
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
