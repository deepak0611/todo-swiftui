//
//  TodoListView.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import SwiftUI
import FirebaseFirestoreSwift

struct TodoListView: View {
    
    @StateObject var viewModel: TodoListViewViewModel
    @FirestoreQuery var items: [TodoListItem]
    
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
        self._items = FirestoreQuery(collectionPath: "users/\(userId)/todos")
        self._viewModel = StateObject(wrappedValue: TodoListViewViewModel(userId: userId))
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List(items) { item in
                    TodoListItemView(item: item)
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: item.id)
                            }
                            .tint(.red)
                        }
                   
                }
                .listStyle(PlainListStyle())
            }
            
            .navigationTitle("Todo List")
            .toolbar {
                Button(action: {
                    viewModel.showingNewItemView = true
                }, label: {
                    Image(systemName: "plus")
                })
            }
            .sheet(isPresented: $viewModel.showingNewItemView, content: {
                NewItemView(newItemPresented: $viewModel.showingNewItemView)
            })
        }
    }
}

#Preview {
    TodoListView(userId: "mlzRgQ6Si9R2wNrbRXeUs2r53RA3")
}
