//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Akshay kumar shaw on 14/10/24.
//

import Foundation

class ListViewModel: ObservableObject {
    
    @Published
    var items: [ItemModel] = []{
        didSet {
            saveItems()
        }
    }
    let itemsKey = "items_list"
    
    init() {
        getItems()
    }
    
    func getItems() {
        guard
            let newItemsJson = UserDefaults.standard.data(forKey: itemsKey),
            let newItems = try? JSONDecoder().decode([ItemModel].self, from: newItemsJson)
        else { return }
        
        items.append(contentsOf: newItems)
    }

    func deleteItem(indexSet: IndexSet){
        items.remove(atOffsets: indexSet)
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = ItemModel(title: title, isCompleted: false)
        items.append(newItem)
    }
    
    func toggleCompletion(item: ItemModel){
        if let index = items.firstIndex(where: { $0.id == item.id }){
            items[index] = item.toggleCompletion()
        }
    }
    
    func saveItems(){
        if let encodedData = try? JSONEncoder().encode(items){
            UserDefaults.standard.set(encodedData, forKey: itemsKey)
        }
    }
    
}
