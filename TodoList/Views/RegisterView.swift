//
//  RegisterView.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import SwiftUI

struct RegisterView: View {
    
   @StateObject var viewModel = RegisterViewViewModel()
    
    var body: some View {
        
        VStack {
            HeaderView(title: "Register",
                       subtitle: "start organising todos",
                       angle: -15,
                       background: .orange)
            
            Form {
                TextField("Full Name", text: $viewModel.name)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                
                TextField("Email Address", text: $viewModel.email)
                    .textFieldStyle(DefaultTextFieldStyle())
                    .autocorrectionDisabled()
                    .autocapitalization(.none)

                SecureField("Password", text: $viewModel.password)
                    .textFieldStyle(DefaultTextFieldStyle())
                TLButton(title: "Cretae  account", background: .green) {
                    //attempt registration
                    viewModel.register()
                }
                .padding()
                
            }
            
            Spacer()
        }
        
    }
}

#Preview {
    RegisterView()
}
