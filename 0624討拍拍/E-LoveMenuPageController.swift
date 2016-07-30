//
//  E-LoveMenuPageController.swift
//  0624討拍拍
//
//  Created by Loso on 2016/7/8.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class ELoveMenuPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var ClearBtn: UIButton!
    @IBOutlet var tableView: UITableView!
    
    var titles = ["炸甜不辣","綠蓋茶","富士山冰奶茶","水餃","熱奶茶","黃金柚子茶"]
    var prices = ["80 元","65 元","80 元","80 元","100 元","80 元"]
    
    
    
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
        
        let alert = UIAlertController(title: "提示", message: "已加入搜藏菜色", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }
    
//    @IBAction func ClearAction(sender: AnyObject) {
//        
//        self.titles = ["","","","","",""]
//        self.prices = ["","","","","",""]


        
        
    }
    
    

