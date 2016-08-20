//
//  MenuViewController.swift
//  0624討拍拍
//
//  Created by 楊喬宇 on 2016/8/14.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseDatabase

class MenuViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var menuTable: UITableView!
    
    var dataSource = []
    var id = String()
    var name = String()
    var ref:FIRDatabaseReference!
    
    var categories = [AnyObject]()
    var keys = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = FIRDatabase.database().reference()
        
        ref.child("menu/\(self.id)").observeEventType(.Value, withBlock: {
            snapshot in

            if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                self.categories = snapshots
            }
            
            self.menuTable.reloadData()
        })
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
        return categories.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("menuCell")
        if (cell != nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1,
                                   reuseIdentifier: "menuCell")
        }
        /*
         * Do Search From Firebase Database
         */
        
        cell?.textLabel?.text = categories[indexPath.row].value!["name"] as? String
        cell?.detailTextLabel?.text = String(categories[indexPath.row].value!["members"]!!.count)
        
        return cell!
    }
    
    // MARK: -- UITableViewDelegate
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDish" {
            if let dishViewController = segue.destinationViewController as? DishViewController {
                let category = sender as! FIRDataSnapshot
                dishViewController.id = self.id
                dishViewController.name = self.name
                dishViewController.categoryName = category.value!["name"] as! String
                dishViewController.dishKey = category.key 
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toDish", sender: self.categories[indexPath.row])
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
