//
//  DataController.swift
//  CoreDataTest
//
//  Created by user on 2023/07/12.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "SickSanghaeModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error {
                print("Failed to load persistentStore")
                print(error.localizedDescription)
            }
        }
    }
}
