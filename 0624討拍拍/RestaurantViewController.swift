//
//  RestaurantViewController.swift
//  0624討拍拍
//
//  Created by 楊喬宇 on 2016/8/14.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseDatabase

class RestaurantViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var restaurantAddress: UILabel!
    @IBOutlet weak var menuButton: UIButton!
    @IBOutlet weak var favoriteButton: UIButton!
    @IBOutlet weak var identityTable: UITableView!
    
    var id = String()
    var ref:FIRDatabaseReference!
    
    var data = [AnyObject]()
    var titles = ["近期优惠","营业时间","店家评价","平均价位","店家电话","菜单更新时间","备注","給菜單提供者一個鼓勵吧！"]
    var contents = ["","","","","","","",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        ref = FIRDatabase.database().reference()
        
        ref.child("res/\(id)/").observeEventType(.Value, withBlock: { snapshot in
            
            self.restaurantAddress.textColor = UIColor(red: 1, green: 0.73, blue: 0.02, alpha: 1)
            self.restaurantAddress.textAlignment = NSTextAlignment.Center
            
            self.menuButton.setTitleColor(UIColor(red: 0, green: 0.08, blue: 0.34, alpha: 1), forState: UIControlState.Normal)
            self.menuButton.setTitle("浏览菜单", forState: UIControlState.Normal)
            
            self.favoriteButton.setTitleColor(UIColor(red: 1, green: 0.73, blue:0.02, alpha:1), forState: UIControlState.Normal)
            self.favoriteButton.setTitle("浏览已收藏菜色", forState: UIControlState.Normal)
            
            if let title = snapshot.value!["name"] as? String {
                self.title = title
            }
            if let address = snapshot.value!["displayAddress"] as? String {
                self.restaurantAddress.text = address
            }
            
            self.contents.removeAll()
            if let discount = snapshot.value!["discount"] as? String {
                self.contents.append(discount)
            }
            if let openTime = snapshot.value!["openTime"] as? String {
                self.contents.append(openTime)
            }
            if let rank = snapshot.value!["rank"] as? String {
                self.contents.append(rank)
            }
            if let price = snapshot.value!["price"] as? String {
                self.contents.append(price)
            }
            if let phone = snapshot.value!["phone"] as? String {
                self.contents.append(phone)
            }
            if let refresh = snapshot.value!["refresh"] as? String {
                self.contents.append(refresh)
            }
            if let ps = snapshot.value!["ps"] as? String {
                self.contents.append(ps)
            }
            self.contents.append("")
            
            self.identityTable.reloadData()
        })
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func toMenu(sender: AnyObject) {
        self.performSegueWithIdentifier("toMenu", sender: self.id)
    }
    
    @IBAction func toFavorite(sender: AnyObject) {
        self.performSegueWithIdentifier("toSave", sender: self.title!)
    }
    
    // MARK: -- UITableViewDataSource
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor(red: 0, green: 0.08, blue: 0.34, alpha: 1)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("identityCell")
        if (cell != nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1,
                                   reuseIdentifier: "identityCell")
        }
        /*
         * Do Search From Firebase Database
         */
        cell?.textLabel?.text = titles[indexPath.row]
        cell?.detailTextLabel?.text = contents[indexPath.row]
        
        return cell!
    }
    
    // MARK: -- UITableViewDelegate
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toMenu" {
            if let menuViewController = segue.destinationViewController as? MenuViewController {
                menuViewController.id = sender as! String
                menuViewController.name = self.title!
            }
        } else if segue.identifier == "toSave" {
            if let saveViewController = segue.destinationViewController as? SaveViewController {
                saveViewController.name = sender as! String
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let alert = UIAlertController(title: titles[indexPath.row], message: contents[indexPath.row], preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
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
