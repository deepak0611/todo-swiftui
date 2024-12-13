//
//  ProfileView.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                if let user = viewModel.user {
                   profile(user: user)
                } else {
                    Text("Profile Loading...")
                }
            }
            
            .navigationTitle("Profile")
        }
        
        .onAppear{
            viewModel.fetchUser()
        }
    }
    
    
    @ViewBuilder
    func profile(user: User) -> some View {
        //Avatar
        Image(systemName: "person.circle")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
            .frame(width: 125, height: 125)
            .padding(/*@START_MENU_TOKEN@*/EdgeInsets()/*@END_MENU_TOKEN@*/)
        
        VStack(alignment: .center) {
            HStack {
                Text("Name: ")
                    .bold()
                Text(user.name)
            }
            .padding()
            
            HStack {
                Text("Email: ")
                    .bold()
                Text(user.email)
            }
            .padding()
            
            HStack {
                Text("Member Since: ")
                    .bold()
                Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))")
            }
            .padding()
            
            Button("Logout") {
                viewModel.logout()
            }
            .foregroundColor(.red)
            .padding()
            
            Spacer()
            
        }
        
    }
}

#Preview {
    ProfileView()
}
