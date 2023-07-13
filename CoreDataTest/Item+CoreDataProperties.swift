//
//  Item+CoreDataProperties.swift
//  CoreDataTest
//
//  Created by user on 2023/07/13.
//
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item")
    }

    @NSManaged public var buyDate: Date
    @NSManaged public var buyPlace: String?
    @NSManaged public var fastConsume: Bool
    @NSManaged public var icon: Data
    @NSManaged public var name: String
    @NSManaged public var price: Double
    @NSManaged public var state: Int16

    
    var status: ItemStatus {
        get {
            return ItemStatus(rawValue: self.state) ?? .UnConsumed
        }
        
        set {
            self.state = newValue.rawValue
        }
    }
}

extension Item : Identifiable {

}
