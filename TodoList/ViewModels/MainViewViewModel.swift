//
//  MainViewViewModel.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import Foundation
import FirebaseAuth

class MainViewViewModel: ObservableObject {
    
    @Published var userId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener({ [weak self] _, user in
            DispatchQueue.main.async {
                self?.userId = user?.uid ?? ""
            }
        })
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}
