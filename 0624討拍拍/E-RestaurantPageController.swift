//
//  E-RestaurantPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/6.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import CoreData

class ERestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    
    var identities = [String]()
    
    var titles = ["近期优惠","营业时间","店家评价","平均价位","店家电话","菜单更新时间","备注","給菜單提供者一個鼓勵吧！"]
    var contents = ["暂无","中午12点 至 下午十一点","4.2颗星","72元","02-2904-5456","2016.6","无",""]
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //        identities = ["D-menu"]
        //        //尋找Storyboard的identities，Trigger Segue
        //
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
    //    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    //
    //        let vcName = identities[indexPath.row]
    //        let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
    //        self.navigationController?.pushViewController(viewController!, animated: true)
    //        
    //    }
    //    
    
    
    
}

