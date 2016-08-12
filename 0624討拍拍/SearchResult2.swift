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
    
    var names = ["点亮咖啡","好窝咖啡","帕多瓦CAFE","小木屋咖啡馆","玥饮轩","巴犁米咖啡","女巫店","5 sense","婆娑咖啡","星巴克公馆店"]
    var services = ["4.5颗星","4.2颗星","4.0颗星","3.9颗星","3.8颗星","3.7颗星","3.6颗星","3.5颗星","3.5颗星","4颗星"]
    
    var receiveStringPlace = ""
    var receiveStringSeries = ""
    var receiveStringPrice = ""
    var receiveStringTime = ""
    
    var ref: FIRDatabaseReference!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        identities = ["綠蓋輔大","老董","熊吧","綠蓋輔大","劉記"]
        //尋找Storyboard的identities，Trigger Segue
        
        ref = FIRDatabase.database().reference()
        
        print("Hi");
        print("receiveStringSeries:",receiveStringSeries);
        
        /*
        ref.queryOrderedByChild("name").queryEqualToValue("000").on("child_added", function(snapshot){
                print(snapshot.key());
            })
        */
        
        /*
        ref.child("res").queryOrderedByChild("name").queryEqualToValue("Kitchen66").observeEventType(.ChildAdded, withBlock: { snapshot in
            /*if let name = snapshot.value!["name"] as? String {
                print("db content")
                print("\(snapshot.key) name \(name) . ")
                print(snapshot.key)
            } else {
                print("db fail")
            }*/
            //let name = snapshot.value!["0"]
            //print("\(snapshot.key)")
            print("\(snapshot.value)")
        })
        */
        
        ref.child("res/012/categories").observeEventType(.ChildAdded, withBlock: { snapshot in
            let groupkey = snapshot.key
            self.ref.child("categories/" + groupkey + "/name").observeEventType(.Value, withBlock:{ snapshot in
                print(snapshot.value)
            })
        })
        
        
        
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

