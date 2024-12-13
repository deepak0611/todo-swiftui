//
//  User.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let joined: TimeInterval
}
