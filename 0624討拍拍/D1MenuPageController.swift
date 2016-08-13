//
//  D-1-1MenuPageController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/4.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import CoreData

class D1MenuRestaurantPageController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tableView: UITableView!
    
//    var identities = [String]()
    
    var titles = ["就爱花生酱吐司","私房梅酱佐鸡腿排吐司","熊巴夏威夷吐司","欧姆蛋佐青酱吐司","柠檬猪排佐熊巴酱吐司","熊巴麦香鱼"]
    var prices = ["110 元","120 元","110 元","120 元","120 元","130 元"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
//        
//        identities = ["D手感吐司","D法式烤布蕾吐司","D熊巴鬆餅","D熊巴早午餐","D熊點心","D飲品","D黑熊咖啡","D冰釀茶飲","D花草茶飲"]
        //尋找Storyboard的identities，Trigger Segue
        
        
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
    
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        let vcName = identities[indexPath.row]
//        let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
//        self.navigationController?.pushViewController(viewController!, animated: true)
//        
//    }
    
    // - MARK: 按下選項時會跳出 UIAlert Message -----
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let alert = UIAlertController(title: "提示", message: "已加入收藏菜色", preferredStyle: UIAlertControllerStyle.Alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
        self.presentViewController(alert, animated: true, completion: nil)
        
    }

    
    
}
