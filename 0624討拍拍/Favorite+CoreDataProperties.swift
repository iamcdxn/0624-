//
//  Entity+CoreDataProperties.swift
//  0624討拍拍
//
//  Created by 楊喬宇 on 2016/8/13.
//  Copyright © 2016年 Uxpa_Everyday. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Favorite {

    @NSManaged var id: String?
    @NSManaged var name: String?
    @NSManaged var price: String?
    @NSManaged var restaurant: String?

}
