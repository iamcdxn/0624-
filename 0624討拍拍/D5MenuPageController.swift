//
//  D5MenuPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/4.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class D5MenuRestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var titles = ["荷包蛋","鸡块","薯条","烤布蕾吐司","泰式柠檬猪","纽奥良鸡腿排","玉米布丁棒（油炸）","生菜沙拉盘","香酥鸡腿排（油炸）","墨西哥脆腿（2支）","南瓜汤"]
    var prices = ["10 元","50 元","50 元","60 元","40 元","50 元","50 元","50 元","50 元","50 元","60 元"]
    
    
    
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
