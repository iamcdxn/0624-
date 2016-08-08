//
//  PersonalViewController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/6/24.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class PersonalViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
        
        @IBOutlet var tableView: UITableView!
        
        
        var identities = [String]()
        
        var titles = ["个人资料","知道更多","回报建议","设定通知"]
        var contents = ["","","",""]
        
        
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            // Do any additional setup after loading the view, typically from a nib.
            
            identities = ["SaveDataTest","","",""]
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
            let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomRestaurantCell
            
            cell.Title.text = titles[indexPath.row]
            cell.Content.text = contents[indexPath.row]
            
            return cell
        }
    
    
    // - MARK: 按下選項時會跳出 UIAlert Message -----
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {


//        let alert = UIAlertController(title: "您好", message: "内容陆续更新中", preferredStyle: UIAlertControllerStyle.Alert)
//        alert.addAction(UIAlertAction(title: "😆😁😝", style: UIAlertActionStyle.Default, handler: nil))
//        self.presentViewController(alert, animated: true, completion: nil)
        
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    

    
}

