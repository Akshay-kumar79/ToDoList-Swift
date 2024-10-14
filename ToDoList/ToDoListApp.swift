//
//  ToDoListApp.swift
//  ToDoList
//
//  Created by Akshay kumar shaw on 14/10/24.
//

import SwiftUI

@main
struct ToDoListApp: App {
    
    @StateObject
    var listViewModel: ListViewModel = ListViewModel()
    
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ListView()
            }
            .environmentObject(listViewModel)
        }
    }
}
