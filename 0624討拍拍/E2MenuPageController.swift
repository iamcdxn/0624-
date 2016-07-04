//
//  E2MenuPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/5.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class E2MenuRestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    var titles = ["花果賞 - 賞花 / 杯","花果賞 - 賞果 / 杯","熱奶茶 / 壺","日本牛奶 / 杯","黃金柚子茶 / 杯","皮拿 / 杯"]
    var prices = ["60元","60元","100元","100元","80元","65元"]
    
    
    
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
