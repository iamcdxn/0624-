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
    var ref:FIRDatabaseReference!
    //var titles = ["汤面类","干面类","汤类","其他"]
    //var contents = ["9 项","9 项","7 项","1 项"]
    
    var categoryNames = [String]()
    var categoryCount = [UInt]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        ref = FIRDatabase.database().reference()
        
        ref.child("menu/\(id)").observeEventType(.Value, withBlock: { snapshot in
            var categoryKeys = [String]()
            for cat in snapshot.children {
                categoryKeys.append(cat.key)
            }
            
            for k in categoryKeys {
                let key = String(k)
                self.ref.child("menu/\(self.id)/\(key)/name").observeEventType(.Value, withBlock: { snapshot in
                    self.categoryNames.append(String(snapshot.value!))
                })
                self.ref.child("menu/\(self.id)/\(key)/members").observeEventType(.Value, withBlock: { snapshot in
                    self.categoryCount.append(snapshot.childrenCount)
                })
            }
        })
        print("...\(self.categoryNames)")
        print("...\(self.categoryCount)")
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
        return categoryNames.count
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
        
        print(categoryNames)
        print(categoryCount)
        
        cell?.textLabel?.text = String(categoryNames[indexPath.row])
        cell?.detailTextLabel?.text = String(categoryCount[indexPath.row])
        
        return cell!
    }
    
    // MARK: -- UITableViewDelegate
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        /*if segue.identifier == "toMenu" {
            if let restaurantViewController = segue.destinationViewController as? RestaurantViewController {
                //print(sender![0], sender![1])
                if let name = sender![0] as? String {
                    restaurantViewController.restaurantTitle.title = name
                }
                if let address = sender![1] as? String {
                    restaurantViewController.labelText = address
                }
                
                //restaurantViewController.id = sender as! String
            }
        }*/
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*var info = [String]()
        info.append(names[indexPath.row])
        info.append(address[indexPath.row])
        performSegueWithIdentifier("toMenu", sender: info)*/
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
