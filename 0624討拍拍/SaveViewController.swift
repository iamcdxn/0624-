//
//  SaveViewController.swift
//  0624討拍拍
//
//  Created by 楊喬宇 on 2016/8/21.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import CoreData

class SaveViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var saveTable: UITableView!
    
    var name = String()
    var dataSource = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
        request.predicate = NSPredicate(format: "restaurant = %@", self.name)
        
        // 執行查詢
        do {
            // 將查詢結果存入 data source
            dataSource = try context.executeFetchRequest(request)
            saveTable.reloadData()
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
    
    // MARK: -- UITableViewDataSource
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor(red: 0, green: 0.08, blue: 0.34, alpha: 1)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("saveCell")
        if (cell != nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1,
                                   reuseIdentifier: "saveCell")
        }
        /*
         * Do Search From Firebase Database
         */
        let dish = dataSource[indexPath.row] as? Favorite
        cell?.textLabel?.text = dish!.name
        cell?.detailTextLabel?.text = dish!.price
        
        return cell!
    }
    
    // MARK: -- UITableViewDelegate
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
