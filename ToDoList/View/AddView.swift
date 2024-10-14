//
//  AddView.swift
//  ToDoList
//
//  Created by Akshay kumar shaw on 14/10/24.
//

import SwiftUI

struct AddView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var listViewModel: ListViewModel
    @State var text: String = ""
    
    @State var alertTile: String = ""
    @State var showAlert: Bool = false
    
    var body: some View {
        VStack {
            ScrollView {
                TextField("Type something here...", text: $text)
                    .padding(.horizontal)
                    .frame(height: 55)
                    .background(Color(UIColor.secondarySystemBackground))
                    .cornerRadius(10)
                
                Button(action: {
                    if validateText(){
                        listViewModel.addItem(title: text)
                        presentationMode.wrappedValue.dismiss()
                    }
                }, label: {
                    Text("Save".uppercased())
                        .foregroundColor(.white)
                        .font(.headline)
                        .frame(height: 55)
                        .frame(maxWidth: .infinity)
                        .background(Color.accentColor)
                        .cornerRadius(10)
                    
                })
            }
            .navigationTitle("Add an Item")
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text(alertTile))
            })
        }.padding(14)
    }
    
    func validateText() -> Bool {
        if text.count > 5{
            return true
        }else{
            alertTile = "Your new todo item must be atleast 5 characters long 😐"
            showAlert.toggle()
            return false
        }
    }
    
}

#Preview {
    NavigationView {
        AddView()
    }
}
