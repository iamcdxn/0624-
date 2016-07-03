//
//  D-1MenuPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/4.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class DMenuRestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
    
    var identities = [String]()
    
    var titles = ["手感吐司","法式烤布蕾吐司","熊巴鬆餅","熊巴早午餐","熊點心","飲品","黑熊咖啡","冰釀茶飲","花草茶飲"]
    var contents = ["6項","7項","8項","6項","11項","8項","9項","8項","4項"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        identities = ["D手感吐司","D法式烤布蕾吐司","D熊巴鬆餅","D熊巴早午餐","D熊點心","D飲品","D黑熊咖啡","D冰釀茶飲","D花草茶飲"]
        //尋找Storyboard的identities，Trigger SeguetableView	UITableView	0x000000012c8e1000
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return titles.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomMenuSeriesCell
        
        cell.Title.text = titles[indexPath.row]
        cell.Num.text = contents[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    
    
    
}
