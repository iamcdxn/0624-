//
//  B4MenuPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/4.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//


import UIKit

class B4MenuRestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var titles = ["小籠湯包","牛肉捲餅","烤肉捲餅","牛肉餡餅","蔥花卷","芝麻花捲","花生花捲","奶油花卷","起士花捲","綜合拼盤（牛筋、牛腱、牛肚、牛雜）","牛肉薄片","韓國烤肉","雞腿","香蒜排骨","小菜","湖州粽","飲料"]
    var prices = ["80元","80元","70元","30元","20元","20元","20元","20元","20元","200元","110元","75元","75元","65元","35元","55元","25元"]
    
    
    
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
