//
//  E1MenuPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/5.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class E1MenuRestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var titles = ["氣泡系列","綠蓋茶","綠蓋茶（奶酪加量）","紅蓋茶","紅蓋茶（奶酪加量）","烏龍蓋茶","富士山冰奶茶","裸茶","裸茶（加奶酪）","日本牛奶","皮拿","清淬綠茶","多荔多汁"]
    var prices = ["65元","65元","100元","80元","120元","65元","80元","60元","75元","100","65","60","65"]
    
    
    
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
