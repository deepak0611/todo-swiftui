//
//  TodoListItemView.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import SwiftUI

struct TodoListItemView: View {
    @StateObject var viewModel = TodoListItemViewViewModel()
    
    let item: TodoListItem
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.title)
                    .font(.title)
                
                Text("\(Date(timeIntervalSince1970: item.dueDate).formatted(date: .abbreviated, time: .shortened))")
                    .font(.footnote)
                    .foregroundColor(Color(.secondaryLabel))
                
                
            }
            
            Spacer()
            
            Button(action: {
                viewModel.toggleIsDone(item: item)
            }, label: {
                Image(systemName: item.isDone ? "checkmark.circle.fill" : "circle")
                    .foregroundColor(.blue)
            })
        }
    }
}

#Preview {
    TodoListItemView(item: TodoListItem(id: "1234", title: "title", dueDate: Date().timeIntervalSince1970, createdDate: Date().timeIntervalSince1970, isDone: false))
}
