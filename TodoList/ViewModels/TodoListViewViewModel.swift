//
//  TodoListViewViewModel.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import Foundation
import FirebaseFirestore

//viewmodel for list of items view
//primary tab
class TodoListViewViewModel: ObservableObject {
    
    @Published var showingNewItemView = false
    private let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(id)
            .delete()
        
    }
}
