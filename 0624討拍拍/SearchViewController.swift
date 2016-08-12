//
//  SecondViewController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/6/24.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController{
    
    
    @IBOutlet var ButtonPrice: UIButton!
    @IBOutlet var ButtonTime: UIButton!
    @IBOutlet weak var button2: UIButton!
    var receiveStringPlace = ""
    var receiveStringSeries = ""
    var receiveStringPrice = ""
    var receiveStringTime = ""
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
        
        
        //Mark-----變更顯示Title
        
        if receiveStringSeries == ""
        {
        button2.setTitle("请选择", forState: .Normal)
        }else{
            button2.setTitle("\(receiveStringSeries)", forState: .Normal)
            
            
        }
        
        //Mark-----變更顯示Title
        
        
        if receiveStringPrice == ""
        {
            ButtonPrice.setTitle("请选择", forState: .Normal)
        }else{
            ButtonPrice.setTitle("\(receiveStringPrice)", forState: .Normal)
        }
        
        
        //Mark-----變更顯示Title
        
        
        if receiveStringTime == ""
        {
            ButtonTime.setTitle("请选择", forState: .Normal)
        }else{
            ButtonTime.setTitle("\(receiveStringTime)", forState: .Normal)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ResultSegue" {
            if let secondVC = segue.destinationViewController as? SearchResult2Controller {
                
                secondVC.receiveStringTime = receiveStringTime;
                secondVC.receiveStringPlace =
                    receiveStringPlace;
                secondVC.receiveStringPrice =
                    receiveStringPrice;
                secondVC.receiveStringSeries =
                    receiveStringSeries;
                print("receiveStringSeries:", receiveStringSeries);
            } else {
                print("segue fail1");
            }
        } else {
            print("segue fail2");
        }
    }

    
    
    }

    
    
    
    
    



