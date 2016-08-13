//
//  SearchResult.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/3.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//


import UIKit
import Foundation
import Firebase
import CoreData


class SearchResultController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    var dataSource = []
    var identities = [String]()
    var names = ["山西刀削面","小木屋咖啡馆","老董牛肉细粉面店","熊巴吐司（台北复兴店）","刘记川味牛肉面"]
    var services = ["3.9颗星","4.2颗星","3.5颗星","3.6颗星","3.3颗星"]
    var address = ["台北市中正区罗斯福路四段24巷12弄10-1号\n捷运公馆站 250 公尺", "新北市新庄区中正路516-12号\n捷运辅大站 250 公尺", "台北市中正区罗斯福路四段24巷4号\n捷运公馆站 110 公尺", "台北市大安区复兴南路二段342号之1\n捷运公馆站 250 公尺", "台北市大安区罗斯福路三段316巷8弄6号\n捷运公馆站 200 公尺"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //尋找Storyboard的identities，Trigger Segue
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    /*func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath) as! CustomCell
        
        cell.Name.text = names[indexPath.row]
        cell.Service.text = services[indexPath.row]
        
        return cell
    }*/
    
    // MARK: -- UITableViewDataSource
    
    // MARK: ---- Change Cell Color
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor(red: 0, green: 0.05, blue: 0.27, alpha: 1)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
    }
    // MARK: ---- Get Cell Number
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }
    // MARK: ---- Get Cell Label
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("searchCell")
        if (cell != nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1,
                                   reuseIdentifier: "searchCell")
        }
        /*
         * Do Search From Firebase Database
         */
        cell?.textLabel?.text = names[indexPath.row]
        cell?.detailTextLabel?.text = services[indexPath.row]
        
        return cell!
    }

    // MARK: -- UITableViewDelegate
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toRestaurant" {
            if let restaurantViewController = segue.destinationViewController as? RestaurantViewController {
                //print(sender![0], sender![1])
                if let name = sender![0] as? String {
                    restaurantViewController.restaurantTitle.title = name
                }
                if let address = sender![1] as? String {
                    restaurantViewController.labelText = address
                }
                
                //restaurantViewController.id = sender as! String
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        var info = [String]()
        info.append(names[indexPath.row])
        info.append(address[indexPath.row])
        performSegueWithIdentifier("toRestaurant", sender: info)
    }
}

