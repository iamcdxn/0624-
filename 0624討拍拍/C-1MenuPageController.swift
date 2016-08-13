//
//  C-1MenuPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/4.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//



import UIKit
import CoreData
import Firebase
import FirebaseDatabase

class CMenuRestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    
    var identities = [String]()
    
    var titles = ["面食","干面","汤类"]
    var contents = ["（可选面、米粉或冬粉，加大加10元）11 项","（加大加10元） 4 项","5 项"]
    
    var id:String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        identities = ["C麵食","C乾麵","C湯類"]
        //尋找Storyboard的identities，Trigger Segue
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomMenuSeriesCell
        
        cell.Title.text = titles[indexPath.row]
        cell.Num.text = contents[indexPath.row]
        
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "C麵食" {
            if let cMenuRestaurantPageController = segue.destinationViewController as? C1MenuRestaurantPageController {
                cMenuRestaurantPageController.id = sender as? String
            }
        } else if (segue.identifier == "C乾麵") {
            if let cMenuRestaurantPageController = segue.destinationViewController as? C2MenuRestaurantPageController {
                cMenuRestaurantPageController.id = sender as? String
            }
        } else if (segue.identifier == "C湯類") {
            if let cMenuRestaurantPageController = segue.destinationViewController as? C3MenuRestaurantPageController {
                cMenuRestaurantPageController.id = sender as? String
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vcName = identities[indexPath.row]
        performSegueWithIdentifier(vcName, sender: self.id)
        
    }
    
    
    
    
}
