//
//  CoreDataTestApp.swift
//  CoreDataTest
//
//  Created by user on 2023/07/12.
//

import SwiftUI

@main
struct CoreDataTestApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
