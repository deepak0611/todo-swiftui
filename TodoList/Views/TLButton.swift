//
//  TLButton.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 29/07/24.
//

import SwiftUI

struct TLButton: View {
    
    let title: String
    let background: Color
    let action: () -> Void
    
    var body: some View {
        
        Button(action: {
            action()
        }, label: {
            ZStack {
                RoundedRectangle(cornerRadius: 10)
                    .foregroundColor(background)
                
                Text(title)
                    .foregroundColor(.white)
                    .bold()
            }
        })
        
        
    }
}

#Preview {
    TLButton(title: "title", background: .blue, action: {
        //Action
        print("helllo")
    })
}
