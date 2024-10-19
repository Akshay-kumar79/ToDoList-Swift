//
//  ListRowView.swift
//  ToDoList
//
//  Created by Akshay kumar shaw on 14/10/24.
//

import SwiftUI


struct ListRowView: View {
    
    let item: TodoEntity
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.name ?? "")
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 6)
    }
}

#Preview{
    
//    let item1 = TodoEntity(name: "Hello", isCompleted: false)
//    let item2 = ItemModel(name: "Hello", isCompleted: true)
//
//    Group {
//        ListRowView(item: item1)
//        ListRowView(item: item2)
//    }
}
