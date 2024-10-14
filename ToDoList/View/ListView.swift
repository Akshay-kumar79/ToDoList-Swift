//
//  ListView.swift
//  ToDoList
//
//  Created by Akshay kumar shaw on 14/10/24.
//

import SwiftUI

struct ListView: View {
    
    @EnvironmentObject var listViewModel: ListViewModel
    
    var body: some View {
        ZStack{
            if listViewModel.items.isEmpty {
                Text("No Items 😀\n Please add some")
                    .padding(.bottom, 150)
                    .multilineTextAlignment(.center)
            }else {
                List{
                    ForEach(listViewModel.items){ item in
                        ListRowView(item: item)
                            .onTapGesture {
                                withAnimation(.linear) {
                                    listViewModel.toggleCompletion(item: item)
                                }
                            }
                    }
                    .onDelete(perform: listViewModel.deleteItem)
                    .onMove(perform: listViewModel.moveItem)
                }
            }
        }
        .listStyle(PlainListStyle())
        .navigationTitle("Do Stuff 📋")
        .navigationBarItems(
            leading: EditButton(),
            trailing: NavigationLink("Add",destination: AddView())
        )
    }
    
}

#Preview {
    NavigationView{
        ListView()
    }
    .environmentObject(ListViewModel())
}
