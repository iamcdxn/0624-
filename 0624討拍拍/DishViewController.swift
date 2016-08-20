//
//  DishViewController.swift
//  0624討拍拍
//
//  Created by 楊喬宇 on 2016/8/21.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseDatabase

class DishViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    
    @IBOutlet weak var dishTable: UITableView!
    
    var id = String()
    var name = String()
    var categoryName = String()
    var dishKey = String()
    var dishes = [AnyObject]()
    var ref:FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()
        
        self.title = String(categoryName)
        
        ref.child("menu/\(self.id)/\(self.dishKey)/members").observeEventType(.Value, withBlock: {
            snapshot in
            
            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                self.dishes = snapshots
            }
            
            self.dishTable.reloadData()
        })
        // Do any additional setup after loading the view.
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
        return dishes.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("dishCell")
        if (cell != nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1,
                                   reuseIdentifier: "dishCell")
        }
        /*
         * Do Search From Firebase Database
         */
        
        cell?.textLabel?.text = dishes[indexPath.row].value["name"] as? String
        var price:Int?
        price = dishes[indexPath.row].value["price"] as? Int
        cell?.detailTextLabel?.text = "\(price!)"
        
        return cell!
    }
    
    // MARK: -- UITableViewDelegate
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        // 取得 Context
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let context = appDelegate.managedObjectContext
        
        let name = dishes[indexPath.row].value["name"] as? String
        var price:Int?
        price = dishes[indexPath.row].value["price"] as? Int
        
        var duplicate = false
        let request = NSFetchRequest(entityName: "Favorite")
        do {
            let entities = try appDelegate.managedObjectContext.executeFetchRequest(request) as? [NSManagedObject]
            for entity in entities! {
                if let item = entity as? Favorite {
                    if name == item.name {
                        duplicate = true
                    }
                }
            }
        } catch {
            print (error)
        }
        // 儲存
        if duplicate == true {
            let alert = UIAlertController(title: "提示", message: "菜色已存在", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
        } else {
            // 建立 Entity 物件
            let favorite = NSEntityDescription.insertNewObjectForEntityForName("Favorite", inManagedObjectContext: context) as! Favorite
            
            favorite.id = self.id
            favorite.restaurant = self.name
            favorite.name = name
            favorite.price = "\(price!)"
            appDelegate.saveContext()
            let alert = UIAlertController(title: "收藏成功", message: "已加入收藏菜色", preferredStyle: UIAlertControllerStyle.Alert)
            alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alert, animated: true, completion: nil)
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
