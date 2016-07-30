//
//  SearchResult3.swift
//  0624討拍拍
//
//  Created by Loso on 2016/7/8.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//


import UIKit

class SearchResultController3: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    var identities = [String]()
    
    var names = ["点亮咖啡","女巫店","好窝咖啡","小木屋咖啡馆","帕多瓦CAFE","玥饮轩","巴犁米咖啡","5 sense","星巴克公馆店","婆娑咖啡"]
    var services = ["平均 270 元","平均 250 元","平均 240 元","平均 215 元","平均 200 元","平均 190 元","平均 177 元","平均 166 元","平均 140 元"]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        identities = ["山西","綠蓋輔大","老董","熊吧","劉記"]
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
