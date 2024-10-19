//
//  ListViewModel.swift
//  ToDoList
//
//  Created by Akshay kumar shaw on 14/10/24.
//

import Foundation
import CoreData

class ListViewModel: ObservableObject {
    
    @Published
    var items: [TodoEntity] = []
    let container: NSPersistentContainer
    
    init() {
        container = NSPersistentContainer(name: "TodoContainer")
        container.loadPersistentStores { (description, error) in
            if let error = error{
                print("Error loading persistent store: \(error)")
            }else{
                print("Successfully loaded persistent store")
            }
        }
        getItems()
    }
    
    func getItems() {
        let request = NSFetchRequest<TodoEntity>(entityName: "TodoEntity")
        
        do {
            items = try container.viewContext.fetch(request)
        }catch let error {
            print("Error fetching items: \(error)")
        }
    }

    func deleteItem(indexSet: IndexSet){
        guard let index = indexSet.first else { return }
        let entity = items[index]
        container.viewContext.delete(entity)
        saveItems()
    }
    
    func moveItem(from: IndexSet, to: Int){
        items.move(fromOffsets: from, toOffset: to)
    }
    
    func addItem(title: String){
        let newItem = TodoEntity(context: container.viewContext)
        newItem.name = title
        newItem.isCompleted = false
        saveItems()
    }
    
    func toggleCompletion(item: TodoEntity){
        item.isCompleted = !item.isCompleted
        saveItems()
    }
    
    func saveItems(){
        do{
            try container.viewContext.save()
            getItems()
        }catch let error{
            print("Error saving items: \(error)")
        }
    }
    
}
