//
//  ContentView.swift
//  CoreDataTest
//
//  Created by user on 2023/07/12.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            TabView {
                MainView()
                    .tabItem {
                        Label("메인뷰", systemImage: "1.square")
                    }
                
                StatisticView()
                    .tabItem {
                        Label("차트", systemImage: "2.square")
                    }
                
                StoreView()
                    .tabItem {
                        Label("보관함", systemImage: "3.square")
                    }
                
                SettingView()
                    .tabItem {
                        Label("설정", systemImage: "4.square")
                    }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
