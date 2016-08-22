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
import FirebaseDatabase
import CoreData

class SearchResultController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var resultTable: UITableView!
    
    var dataSource = []
    var query = String()
    var filter = String()
    var identities = [String]()
    var names = ["山西刀削面","小木屋咖啡馆","老董牛肉细粉面店","熊巴吐司（台北复兴店）","刘记川味牛肉面"]
    var services = ["3.9颗星","4.2颗星","3.5颗星","3.6颗星","3.3颗星"]
    var address = ["台北市中正区罗斯福路四段24巷12弄10-1号\n捷运公馆站 250 公尺", "新北市新庄区中正路516-12号\n捷运辅大站 250 公尺", "台北市中正区罗斯福路四段24巷4号\n捷运公馆站 110 公尺", "台北市大安区复兴南路二段342号之1\n捷运公馆站 250 公尺", "台北市大安区罗斯福路三段316巷8弄6号\n捷运公馆站 200 公尺"]
    
    //var resultID = ["012", "013", "014", "015", "016"]
    var resultID = [String]()
    var ref:FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //尋找Storyboard的identities，Trigger Segue
        ref = FIRDatabase.database().reference()
        
        if self.filter == "0" {
            
            ref.child("res").observeEventType(.Value, withBlock: {
                snapshot in
                
                if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                    for snap in snapshots {
                        if let name = snap.value!["name"] as? String {
                            if name.rangeOfString(self.query) != nil {
                                self.resultID.append(snap.key)
                            }
                        }
                    }
                }
                
                if self.resultID.isEmpty {
                    self.resultID.append("none")
                }
                
                self.resultTable.reloadData()
            })
            
        } else if self.filter == "1" {
            
            ref.child("res").observeEventType(.Value, withBlock: {
                snapshot in
                
                if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                    for snap in snapshots {
                        if let address = snap.value!["displayAddress"] as? String {
                            if address.rangeOfString(self.query) != nil {
                                self.resultID.append(snap.key)
                            }
                        }
                    }
                }
                
                if self.resultID.isEmpty {
                    self.resultID.append("none")
                }
                
                self.resultTable.reloadData()
            })
            
        } else if self.filter == "2" {
            
            ref.child("menu").observeEventType(.Value, withBlock: {
                snapshot in
                
                if let snapshots = snapshot.children.allObjects as? [FIRDataSnapshot] {
                    for snap in snapshots {
                        if let category = snap.children.allObjects as? [FIRDataSnapshot] {
                            for cat in category {
                                if let dishes = cat.childSnapshotForPath("members").children.allObjects as? [FIRDataSnapshot] {
                                    for dish in dishes {
                                        if let name = dish.value!["name"] as? String {
                                            if name.rangeOfString(self.query) != nil {
                                                if self.resultID.contains(snap.key) {
                                                    
                                                } else {
                                                    self.resultID.append(snap.key)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
                
                if self.resultID.isEmpty {
                    self.resultID.append("none")
                }
                
                self.resultTable.reloadData()
            })
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
        
    }
    
    // MARK: -- UITableViewDataSource
    
    // MARK: ---- Change Cell Color
    func tableView(tableView: UITableView, willDisplayCell cell: UITableViewCell, forRowAtIndexPath indexPath: NSIndexPath) {
        cell.backgroundColor = UIColor(red: 0, green: 0.05, blue: 0.27, alpha: 1)
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.detailTextLabel?.textColor = UIColor.lightGrayColor()
    }
    
    // MARK: ---- Get Cell Number
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return resultID.count
    }
    
    // MARK: ---- Get Cell Label
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCellWithIdentifier("resultCell")
        if (cell != nil)
        {
            cell = UITableViewCell(style: UITableViewCellStyle.Value1,
                                   reuseIdentifier: "resultCell")
        }
        /*
         * Do Search From Firebase Database
         */
        if resultID[0] == "none" {
            
            cell?.textLabel?.textColor = UIColor.lightGrayColor()
            cell?.textLabel?.text = "無搜尋結果"
            
        } else {
            
            let id = resultID[indexPath.row] as String
            ref.child("res/\(id)").observeEventType(.Value, withBlock: { snapshot in
                
                if let name = snapshot.value!["name"] as? String {
                    cell?.textLabel?.text = name
                }
                if let rank = snapshot.value!["rank"] as? String {
                    cell?.detailTextLabel?.text = rank
                }
            })
        }
        
        return cell!
    }

    // MARK: -- UITableViewDelegate
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toRestaurant" {
            if let restaurantViewController = segue.destinationViewController as? RestaurantViewController {
                let id = String(sender!)
                restaurantViewController.id = id as String
            }
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if resultID[0] != "none" {
            let id = String(resultID[indexPath.row])
            performSegueWithIdentifier("toRestaurant", sender: id)
        }
    }
    
}

