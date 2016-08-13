//
//  SecondViewController.swift
//  0624討拍拍
//
//  Created by CdxN on 2016/6/24.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController{
    
    
    
    @IBOutlet var ButtonPlace: UIButton!
    @IBOutlet var ButtonPrice: UIButton!
    @IBOutlet var ButtonTime: UIButton!
    @IBOutlet weak var buttonSeries: UIButton!
    var receiveStringPlace = ""
    var receiveStringPlaceChild = ""
    var receiveStringSeries = ""
    var receiveStringSeriesChild = ""
    var receiveStringPrice = ""
    var receiveStringTime = ""
    
    var normalText = "Hi am normal"
    
    var boldText  = "And I am BOLD!"
    



    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        //Mark-----變更顯示Title
        if receiveStringSeries == ""
        {
        buttonSeries.setTitle("类别   请选择", forState: .Normal)
        }else{
            buttonSeries.setTitle("类别   \(receiveStringSeries) \(receiveStringSeriesChild)", forState: .Normal)
        }
        
        //Mark-----變更顯示Title
        if receiveStringPrice == ""
        {
            ButtonPrice.setTitle("价位   请选择", forState: .Normal)
        }else{
            ButtonPrice.setTitle("价位   \(receiveStringPrice)", forState: .Normal)
        }
        
        
        //Mark-----變更顯示Title
        if receiveStringTime == ""
        {
            ButtonTime.setTitle("时段   请选择", forState: .Normal)
        }else{
            ButtonTime.setTitle("时段   \(receiveStringTime)", forState: .Normal)
        }
        
        //Mark-----變更顯示Title
        if receiveStringPlace == ""
        {
            ButtonPlace.setTitle("地区   我附近", forState: .Normal)
        }else{
            ButtonPlace.setTitle("地区   \(receiveStringPlace) \(receiveStringPlaceChild)" , forState: .Normal)
        }
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ResultSegue" {
            if let secondVC = segue.destinationViewController as? SearchResult2Controller {
                
                secondVC.receiveStringTime = receiveStringTime;
                secondVC.receiveStringPlace =
                    receiveStringPlace;
                secondVC.receiveStringPrice =
                    receiveStringPrice;
                secondVC.receiveStringSeries =
                    receiveStringSeries;
                print("receiveStringSeries:", receiveStringSeries);
            } else {
                print("segue fail1");
            }
        } else {
            print("segue fail2");
        }
        
        if segue.identifier == "SeguePrice" {
            let secondVC: PickerViewControllerPrice = segue.destinationViewController as! PickerViewControllerPrice
            secondVC.receiveStringPrice = "\(receiveStringPrice)"
            secondVC.receiveStringSeries = "\(receiveStringSeries)"
            secondVC.receiveStringSeriesChild = "\(receiveStringSeriesChild)"
            secondVC.receiveStringPlace = "\(receiveStringPlace)"
            secondVC.receiveStringPlaceChild = "\(receiveStringPlaceChild)"
            secondVC.receiveStringTime = "\(receiveStringTime)"
            
        } else if segue.identifier == "SegueTime"{
            let secondVC: PickerViewControllerTime = segue.destinationViewController as! PickerViewControllerTime
            secondVC.receiveStringPrice = "\(receiveStringPrice)"
            secondVC.receiveStringSeries = "\(receiveStringSeries)"
            secondVC.receiveStringSeriesChild = "\(receiveStringSeriesChild)"
            secondVC.receiveStringPlace = "\(receiveStringPlace)"
            secondVC.receiveStringPlaceChild = "\(receiveStringPlaceChild)"
            secondVC.receiveStringTime = "\(receiveStringTime)"
        } else if segue.identifier == "SegueSeries" {
            let secondVC: PickerViewControllerSeries = segue.destinationViewController as! PickerViewControllerSeries
            secondVC.receiveStringPrice = "\(receiveStringPrice)"
            secondVC.receiveStringSeries = "\(receiveStringSeries)"
            secondVC.receiveStringSeriesChild = "\(receiveStringSeriesChild)"
            secondVC.receiveStringPlace = "\(receiveStringPlace)"
            secondVC.receiveStringPlaceChild = "\(receiveStringPlaceChild)"
            secondVC.receiveStringTime = "\(receiveStringTime)"
            
        } else if segue.identifier == "SeguePlace" {
            let secondVC: PickerViewControllerPlace = segue.destinationViewController as! PickerViewControllerPlace
            secondVC.receiveStringPrice = "\(receiveStringPrice)"
            secondVC.receiveStringSeries = "\(receiveStringSeries)"
            secondVC.receiveStringSeriesChild = "\(receiveStringSeriesChild)"
            secondVC.receiveStringPlace = "\(receiveStringPlace)"
            secondVC.receiveStringPlaceChild = "\(receiveStringPlaceChild)"
            secondVC.receiveStringTime = "\(receiveStringTime)"
        }

    }
    
}
    
    

    
    
    
    
    



