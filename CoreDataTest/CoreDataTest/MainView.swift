//
//  MainView.swift
//  CoreDataTest
//
//  Created by user on 2023/07/12.
//

import SwiftUI

struct MainView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.buyDate, order: .reverse)]) var items: FetchedResults<Item>
    
    var unConsumedItemList: [Item] {
        return items.filter { $0.status == .UnConsumed }
    }
    
    var body: some View {
        VStack {
            List {
                ForEach(items) { item in
                    HStack {
                        Image(uiImage: UIImage(data: item.icon)!)
                            .resizable()
                            .frame(width: 66, height: 66)
                        
                        VStack(alignment: .leading) {
                            Text("상품명: \(item.name)")
                            Text("구매일: \(item.buyDate)")
                            Text("금액: \(Int(item.price))")
                        }
//                        .swipeActions {
//                            Button(role: .destructive) {
//                                changeItemToRottenStatus(target: item)
//                            } label: {
//                                Label("상했어요", systemImage: "minus.circle")
//                            }
//
//                        }
//                        .swipeActions(edge: .leading) {
//                            Button {
//                                changeItemToEatenStatus(target: item)
//                            } label: {
//                                Label("먹었어요", systemImage: "plus.circle")
//                            }
//                            .tint(.green)
//                        }
                    }
                }
                
                .onDelete(perform: removeItem)
            }
            
            
            Button {
                saveData()
            } label: {
                Text("coredata 아이템 추가")
            }
            
            Spacer()
        }
        
    }
    
    func saveData() {
        let item = Item(context: managedObjectContext)
        
        let randomNumber = Int16.random(in: 0...3)
        
        let image = UIImage(named: "testImage")!
        let data = image.pngData()
        item.icon = data!
//        item.name = "test item"
        item.price = Double(6000)
        item.buyDate = Date.now
        item.fastConsume = false
        
        
        switch randomNumber {
        case 0:
            item.name = "아직 안먹음"
        case 1:
            item.name = "먹음"
        case 2:
            item.name = "썩음"
        case 3:
            item.name = "삭제됨"
        default:
            item.name = "아직 안먹음"
        }
        
        item.state = randomNumber
        
        
        try? managedObjectContext.save()
    }
    
    
    func removeItem(offsets: IndexSet) {
        for offset in offsets {
            let item = items[offset]
            
            managedObjectContext.delete(item)
        }
        
        try? managedObjectContext.save()
    }
    
    func changeIsItemDeleted() {
        
    }
    
    func changeIsItemRotten() {
        
    }
    
    func changeItemToRottenStatus(target: Item) {
        for item in items {
            if target == item {
                item.status = .Eaten
                break
            }
        }
        
        try? managedObjectContext.save()
    }
    
    func changeItemToEatenStatus(target: Item) {
        for item in items {
            if target == item {
                item.status = .Rotten
                break
            }
        }
        
        try? managedObjectContext.save()
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
