//
//  TodoListApp.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import FirebaseCore
import SwiftUI

@main
struct TodoListApp: App {
    
    init() {
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
