//
//  TodoListItem.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import Foundation

struct TodoListItem: Codable, Identifiable {
    let id: String
    let title: String
    let dueDate: TimeInterval
    let createdDate: TimeInterval
    var isDone: Bool
    
    mutating func setDone(_ state: Bool) {
        isDone = state
    }
}
