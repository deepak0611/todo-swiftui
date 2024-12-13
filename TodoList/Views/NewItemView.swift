//
//  NewItemView.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import SwiftUI

struct NewItemView: View {
    
    @StateObject var viewModel = NewItemViewViewModel()
    
    @Binding var newItemPresented: Bool
    
    
    var body: some View {
        VStack {
            
            Text("New Item")
                .font(.system(size: 32))
                .bold()
            
            Form {
                TextField("Title", text: $viewModel.title)
                    .textFieldStyle(DefaultTextFieldStyle())
                
                DatePicker("Due Date", selection: $viewModel.dueDate)
                    .datePickerStyle(GraphicalDatePickerStyle())
                
                TLButton(title: "Save", background: .pink) {
                    if viewModel.canSave {
                        viewModel.save()
                        newItemPresented = false
                    } else {
                        viewModel.showAlert = true
                    }
                    
                }
                .padding()
            }
            .alert(isPresented: $viewModel.showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text("Please enter some title"))
            })
        }
    }
}

#Preview {
    NewItemView( newItemPresented: Binding(get: {
        return true
    }, set: { _ in
        
    }))
}
