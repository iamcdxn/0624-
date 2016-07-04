//
//  SearchResult2.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/5.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class SearchResult2Controller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    var identities = [String]()
    
    var names = ["綠蓋茶館（輔大店）","熊巴吐司","山西刀削麵"]
    var services = ["4.2顆星","3.9顆星","3.6顆星"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        identities = ["綠蓋輔大","熊吧","山西"]
        //尋找Storyboard的identities，Trigger Segue
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.Name.text = names[indexPath.row]
        cell.Service.text = services[indexPath.row]
        
        return cell
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        let vcName = identities[indexPath.row]
        let viewController = storyboard?.instantiateViewControllerWithIdentifier(vcName)
        self.navigationController?.pushViewController(viewController!, animated: true)
        
    }
    
    
    
}
