//
//  TodoListItemViewViewModel.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

//viewMOdel for single todo list item
class TodoListItemViewViewModel: ObservableObject {
    init() {}
    
    func toggleIsDone(item: TodoListItem) {
        var itemCopy = item
        itemCopy.setDone(!item.isDone)
        
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(userId)
            .collection("todos")
            .document(itemCopy.id)
            .setData(itemCopy.asDictionary())
    }
}
