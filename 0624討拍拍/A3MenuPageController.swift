//
//  A3MenuPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/4.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class A3MenuRestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var titles = ["番茄牛肉汤","原汁牛肉汤","榨菜肉丝汤","番茄汤","酸辣汤（素食）","番茄牛肉清汤","牛肉清汤"]
    var prices = ["100 元","30 元","30 元","30 元","30 元","30 元","30 元"]
    
    
    
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
    
    
    
    
}
