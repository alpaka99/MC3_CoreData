//
//  StoreView.swift
//  CoreDataTest
//
//  Created by user on 2023/07/12.
//

import SwiftUI

struct StoreView: View {
    @Environment(\.managedObjectContext) private var managedObjectContext
    @FetchRequest(sortDescriptors: [SortDescriptor(\.buyDate, order: .reverse)]) private var items: FetchedResults<Item>
    
    @State private var segmentedTag = ItemStatus.Eaten
    
    var filteredItems: [Item] {
        switch segmentedTag {
        case ItemStatus.UnConsumed:
            return items.filter { $0.status == .Eaten }
        case ItemStatus.Rotten:
            return items.filter { $0.status == .Rotten }
        case ItemStatus.Deleted:
            return items.filter { $0.status == .Deleted }
        default:
            return items.filter { $0.status == .Eaten }
        }
//        if segmentedTag ==  {
//            return items.filter { ($0.isItemRotten == false) && ($0.isDeleted == true) }
//        } else if segmentedTag == 2 {
//            return items.filter { ($0.isItemRotten == true) && ($0.isItemDeleted == true) }
//        } else {
//                return items.filter { $0.isItemDeleted == true }
//        }
    }
    
    
    var body: some View {
        VStack {
            Picker("Choose part", selection: $segmentedTag) {
                Text("먹었음")
                    .tag(ItemStatus.Eaten)
                Text("상했음")
                    .tag(ItemStatus.Rotten)
                Text("삭제됨")
                    .tag(ItemStatus.Deleted)
            }
            .pickerStyle(.segmented)
            
            List {
                ForEach(filteredItems) { item in
                    HStack {
                        Image(uiImage: UIImage(data: item.icon)!)
                            .resizable()
                            .frame(width: 66, height: 66)
                        
                        VStack(alignment: .leading) {
                            Text("상품명: \(item.name)")
                            Text("구매일: \(item.buyDate)")
                            Text("금액: \(Int(item.price))")
                        }
                    }
                }
            }
            
            Button {
                print("전체 코어데이터 갯수: \(items.count)")
                print("필터링한 갯수: \(filteredItems.count)")
            } label: {
                Text("필터링 테스트")
            }
        }
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
