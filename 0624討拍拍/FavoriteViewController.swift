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
    
    @IBOutlet weak var favoriteTable: UITableView!
    var children = [AnyObject]()
    var dataSource = []
    var ids = [String]()
    var restaurants = [String]()
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
        self.restaurants.removeAll()
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
            for data in dataSource {
                let favorite = data as! Favorite
                if restaurants.contains(favorite.restaurant!) {
                    
                } else {
                    restaurants.append(favorite.restaurant!)
                    ids.append(favorite.id!)
                }
            }
            self.favoriteTable.reloadData()
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
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor(red: 0, green: 0.08, blue: 0.34, alpha: 1)
        cell.textLabel?.textColor = UIColor.whiteColor()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return restaurants.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("favoriteCell")

        cell?.textLabel?.text = restaurants[indexPath.row]
        
        return cell!
    }
    
    // MARK: -- UITableViewDelegate
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetail" {
            if let restaurantViewController = segue.destinationViewController as? RestaurantViewController {
                let id = String(sender!)
                restaurantViewController.id = id as String
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toDetail", sender: ids[indexPath.row])
    }
}
