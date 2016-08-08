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

class RetrieveDataTest:UITableViewController {
    
    var ref: FIRDatabaseReference!
    var resList = [restaurant]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        ref = FIRDatabase.database().reference()
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resList.count
    }
    
    
    
    
}

