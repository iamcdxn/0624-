//
//  FavoriteViewController.swift
//  0624討拍拍
//
//  Created by 楊喬宇 on 2016/8/13.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseDatabase

class FavoriteViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    var dataSource = []
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
                // Do any additional setup after loading the view.
        ref = FIRDatabase.database().reference()
        loadData()
        // 加入通知
        NSNotificationCenter.defaultCenter().addObserver(self, selector: "loadData", name: NSManagedObjectContextDidSaveNotification, object: nil)

    }
    
    func loadData() {
        // 取得 Context
        let appDelegate = UIApplication.sharedApplication().delegate
            as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        // 建立查詢目標
        let request = NSFetchRequest(entityName: "Favorite")
        
        // 執行查詢
        do {
            // 將查詢結果存入 data source
            dataSource = try context.executeFetchRequest(request)
            tableView.reloadData()
        }
        catch let error as NSError {
            // 錯誤處理
            print("error", error.description)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // - MARK: -- UITableViewDataSource
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(dataSource.count)
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCellWithIdentifier("favoriteCell")
        let favorite = dataSource[indexPath.row] as! Favorite
        //cell?.textLabel?.text = favorite.id
        
        ref.child("res/" + favorite.id! + "/name").observeEventType(.Value, withBlock: { snapshot in
            if snapshot.value is NSNull {
                print("error")
                cell?.textLabel?.text = "ERROR"
            } else {
                cell?.textLabel?.text = snapshot.value as? String
            }
        })
        
        return cell!
    }

    // MARK: -- Delete
    
    func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            
            // 取得 TtodoItem
            let favorite = dataSource[indexPath.row] as? Favorite
            
            // 取得 Context
            let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
            let context = appDelegate.managedObjectContext
            
            // 刪除 TodoItem
            context.deleteObject(favorite!)
            
            appDelegate.saveContext()
        }
    }

}
