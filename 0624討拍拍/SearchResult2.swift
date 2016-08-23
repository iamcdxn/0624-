//
//  SearchResult2.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/7/6.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit
import Firebase
import FirebaseDatabase

class SearchResult2Controller: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var tableView: UITableView!
    
    var identities = [String]()
    
    var receiveStringPlaceCity = ""
    var receiveStringPlaceDistrict = ""
    var receiveStringSeries = ""
    var receiveStringPrice = ""
    var receiveStringTime = ""
    
    var ref: FIRDatabaseReference!
    
    var list = [String]()
    var nameList = [String]()
    var rankList = [String]()
    var result = ""

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
            
        //尋找Storyboard的identities，Trigger Segue
        
        ref = FIRDatabase.database().reference()
        
        result = ""
        self.nameList.removeAll()
        self.rankList.removeAll()
        self.list.removeAll()
        
        var isFirstFilterFlag = self.list.isEmpty
        
        // 目前有效的經驗法則，只能呼叫一次ref
        ref.observeEventType(.Value, withBlock:
        {snapshot in
            
            if self.receiveStringTime != "" {
            //從不同的區塊中做餐廳id的篩選，childSnapshotForPath可以往下做區塊導引
            if let categories = snapshot.childSnapshotForPath("categories").children.allObjects as? [FIRDataSnapshot]{
                for category in categories{
                    
                    //從餐廳時間的區塊群中一個一個拿出餐廳時間名稱來比對
                    if let name = category.value!["name"] as? String{
                        if name == self.receiveStringTime{
                            
                            //比對符合者，從該處往下做區塊導引拿取其成員
                            if let members = category.childSnapshotForPath("members").children.allObjects as? [FIRDataSnapshot]{
                                
                                //以下是將不同篩選得到的ids做intersection
                                var tmp = [String]()
                                for member in members{
                                    if let id = member.value! as? String{
                                        tmp.append(id)
                                    }
                                }
                                if(tmp.isEmpty){
                                    if(self.receiveStringTime != ""){
                                        self.list.removeAll()
                                    }
                                } else {
                                    if isFirstFilterFlag {
                                        self.list = tmp
                                        isFirstFilterFlag = false
                                    } else {
                                        var intersect = [String]()
                                        for i in self.list{
                                            if tmp.contains(i){
                                                intersect.append(i)
                                            }
                                        }
                                        self.list = intersect
                                    }
                                }
                            }
                        }
                    }
                }
            }
            }
            
            if self.receiveStringPrice != "" {
            //同上
            if let prices = snapshot.childSnapshotForPath("price").children.allObjects as? [FIRDataSnapshot]{
                for price in prices{
                    if let name = price.value!["name"] as? String{
                        if name == self.receiveStringPrice{
                            if let members = price.childSnapshotForPath("members").children.allObjects as? [FIRDataSnapshot]{
                                var tmp = [String]()
                                for member in members{
                                    if let id = member.value! as? String{
                                        tmp.append(id)
                                    }
                                }
                                if(tmp.isEmpty){
                                    if(self.receiveStringPrice != ""){
                                        self.list.removeAll()
                                    }
                                } else {
                                    if isFirstFilterFlag {
                                        self.list = tmp
                                        isFirstFilterFlag = false
                                    } else {
                                        var intersect = [String]()
                                        for i in self.list{
                                            if tmp.contains(i){
                                                intersect.append(i)
                                            }
                                        }
                                        self.list = intersect
                                    }
                                }
                            }
                        }
                    }
                }
            }
            }
            
            if self.receiveStringPlaceCity != "" {
            //同上
            if let cities = snapshot.childSnapshotForPath("city").children.allObjects as? [FIRDataSnapshot]{
                for city in cities{
                    if let name = city.value!["name"] as? String{
                        if name == self.receiveStringPlaceCity{
                            if let members = city.childSnapshotForPath("members").children.allObjects as? [FIRDataSnapshot]{
                                var tmp = [String]()
                                for member in members{
                                    if let id = member.value! as? String{
                                        tmp.append(id)
                                    }
                                }
                                if(tmp.isEmpty){
                                    if(self.receiveStringPlaceCity != ""){
                                        self.list.removeAll()
                                    }
                                } else {
                                    if isFirstFilterFlag {
                                        self.list = tmp
                                        isFirstFilterFlag = false
                                    } else {
                                        var intersect = [String]()
                                        for i in self.list{
                                            if tmp.contains(i){
                                                intersect.append(i)
                                            }
                                        }
                                        self.list = intersect
                                    }
                                }
                            }
                        }
                    }
                }
            }
            }
            
            if self.receiveStringPlaceDistrict != "" {
            //同上
            if let districts = snapshot.childSnapshotForPath("district").children.allObjects as? [FIRDataSnapshot]{
                for district in districts{
                    if let name = district.value!["name"] as? String{
                        if name == self.receiveStringPlaceDistrict{
                            if let members = district.childSnapshotForPath("members").children.allObjects as? [FIRDataSnapshot]{
                                var tmp = [String]()
                                for member in members{
                                    if let id = member.value! as? String{
                                        tmp.append(id)
                                    }
                                }
                                if(tmp.isEmpty){
                                    if(self.receiveStringPlaceDistrict != ""){
                                        self.list.removeAll()
                                    }
                                } else {
                                    if isFirstFilterFlag {
                                        self.list = tmp
                                        isFirstFilterFlag = false
                                    } else {
                                        var intersect = [String]()
                                        for i in self.list{
                                            if tmp.contains(i){
                                                intersect.append(i)
                                            }
                                        }
                                        self.list = intersect
                                    }
                                }
                            }
                        }
                    }
                }
            }
            }
            
            //拿取餐廳的資料表，將ids對應成名稱和服務星星數
            if let reses = snapshot.childSnapshotForPath("res").children.allObjects as? [FIRDataSnapshot]{
                for res in reses{
                    if self.list.contains(res.key){
                        if let name = res.value!["name"] as? String{
                            self.nameList.append(name)
                        }
                        
                        if let star = res.value!["rank"] as? String{
                            self.rankList.append(star)
                        }
                    }
                    
                }
            }
            
            if self.list.isEmpty || self.nameList.isEmpty || self.rankList.isEmpty {
                self.result = "none"
            }
            //在ref的最後call tableview.reloadData即可讓畫面接著資料完整後更新
            self.tableView.reloadData()
        })
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor(red: 0, green: 0.05, blue: 0.27, alpha: 1)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //reloadData後第一步要告訴tableview有幾個cell
        if (result == "none") {
            return 1
        } else {
            return self.nameList.count
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("cell")
        if (cell != nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1,
                                   reuseIdentifier: "cell")
        }
        
        //reloadDate的第二步便是將資料塞進cell中
        if result == "none" {
            
            cell?.textLabel?.text = "無搜尋結果"
            
        } else {
            cell?.textLabel?.text = nameList[indexPath.row]
            cell?.detailTextLabel?.text = rankList[indexPath.row]
        }
        
        return cell!
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        performSegueWithIdentifier("toRestaurant2", sender: self.list[indexPath.row])
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toRestaurant2" {
            if let restaurantViewController = segue.destinationViewController as? RestaurantViewController {
                let id = String(sender!)
                restaurantViewController.id = id as String
            }
        }
    }
}

