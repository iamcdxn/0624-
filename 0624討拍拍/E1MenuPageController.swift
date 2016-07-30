//
//  E1MenuPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/6.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class E1MenuRestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var titles = ["气泡系列","绿盖茶","绿盖茶（奶酪加量）","红盖茶","红盖茶（奶酪加量）","乌龙盖茶","富士山冰奶茶","裸茶","裸茶（加奶酪）","日本牛奶","皮拿","清淬绿茶","多荔多汁"]
    var prices = ["65 元","65 元","100 元","80 元","120 元","65 元","80 元","60 元","75 元","100 元","65 元","60 元","65 元"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomMenu2Cell
        
        cell.Title.text = titles[indexPath.row]
        cell.Price.text = prices[indexPath.row]
        
        return cell
    }


    // - MARK: 按下選項時會跳出 UIAlert Message -----
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alert = UIAlertController(title: "提示", message: "已加入收藏菜色", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
        }
    
    
    
    
    
}
