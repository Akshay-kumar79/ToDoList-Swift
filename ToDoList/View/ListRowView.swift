//
//  ListRowView.swift
//  ToDoList
//
//  Created by Akshay kumar shaw on 14/10/24.
//

import SwiftUI


struct ListRowView: View {
    
    let item: ItemModel
    
    var body: some View {
        HStack{
            Image(systemName: item.isCompleted ? "checkmark.circle" : "circle")
                .foregroundColor(item.isCompleted ? .green : .red)
            Text(item.title)
            Spacer()
        }
        .font(.title2)
        .padding(.vertical, 6)
    }
}

#Preview{
    
    let item1 = ItemModel(title: "Hello", isCompleted: false)
    let item2 = ItemModel(title: "Hello", isCompleted: true)
    
    Group {
        ListRowView(item: item1)
        ListRowView(item: item2)
    }
}
