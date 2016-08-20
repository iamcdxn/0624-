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
    @IBOutlet weak var identitiyTable: UITableView!
    
    var id = String()
    var dataSource = []
    var ref:FIRDatabaseReference!
    
    var titles = ["近期优惠","营业时间","店家评价","平均价位","店家电话","菜单更新时间","备注","給菜單提供者一個鼓勵吧！"]
    var contents = ["暂无","上午11点 至 下午9点","3.5颗星","175元","02-2369-5198","2016.4","无",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        ref = FIRDatabase.database().reference()
        
        ref.child("res/\(id)/name").observeEventType(.Value, withBlock: { snapshot in
            self.title = String(snapshot.value!)
        })
        
        ref.child("res/\(id)/displayAddress").observeEventType(.Value, withBlock: { snapshot in
            self.restaurantAddress.text = String(snapshot.value!)
        })
        
        restaurantAddress.textColor = UIColor(red: 1, green: 0.73, blue: 0.02, alpha: 1)
        restaurantAddress.textAlignment = NSTextAlignment.Center
        
        menuButton.setTitleColor(UIColor(red: 0, green: 0.08, blue: 0.34, alpha: 1), forState: UIControlState.Normal)
        menuButton.setTitle("浏览菜单", forState: UIControlState.Normal)
        
        favoriteButton.setTitleColor(UIColor(red: 1, green: 0.73, blue:0.02, alpha:1), forState: UIControlState.Normal)
        favoriteButton.setTitle("浏览已收藏菜色", forState: UIControlState.Normal)
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
