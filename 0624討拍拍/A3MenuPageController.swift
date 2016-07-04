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
    
    var titles = ["番茄牛肉湯","原汁牛肉湯","榨菜肉絲湯","番茄湯","酸辣湯（素食）","番茄牛肉清湯","牛肉清湯"]
    var prices = ["100元","30元","30元","30元","30元","30元","30元"]
    
    
    
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
