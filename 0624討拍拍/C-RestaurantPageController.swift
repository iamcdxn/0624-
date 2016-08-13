//
//  C-RestaurantPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/4.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import CoreData
import Firebase
import FirebaseDatabase

class CRestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet weak var Menu: UIButton!
    
    
    var identities = [String]()
    
    var titles = ["近期优惠","营业时间","店家评价","平均价位","店家电话","菜单更新时间","备注","給菜單提供者一個鼓勵吧！"]
    var contents = ["暂无","上午8点 至 下午9点","3.5颗星","110 至 160元","02-2736-9046","2016.5","免服務費，自行取水",""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
//        identities = ["C-menu"]
        //尋找Storyboard的identities，Trigger Segue
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "cFood" {
            if let cMenuRestaurantPageController = segue.destinationViewController as? CMenuRestaurantPageController {
               cMenuRestaurantPageController.id = sender as? String
            }
        }
    }
    
    @IBAction func viewMenu(sender: AnyObject) {
        let id = "014" as String
        performSegueWithIdentifier("cFood", sender: id)
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomRestaurantCell
        
        cell.Title.text = titles[indexPath.row]
        cell.Content.text = contents[indexPath.row]
        
        return cell
    }
    
    
//    
    //尋找Storyboard的identities，Trigger Segue

//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        let vcName = identities[indexPath.row]
//        let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
//        self.navigationController?.pushViewController(viewController!, animated: true)
//        
//    }
    
    
    
    
}

