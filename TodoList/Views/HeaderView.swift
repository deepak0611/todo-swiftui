//
//  HeaderView.swift
//  TodoList
//
//  Created by Deepak Kumar1 on 15/07/24.
//

import SwiftUI

struct HeaderView: View {
    
    let title: String
    let subtitle: String
    let angle: Double
    let background: Color
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 0)
                .foregroundColor(background)
                .rotationEffect(Angle(degrees: angle))
            
            VStack {
                Text(title)
                    .font(.system(size: 48))
                    .foregroundColor(.white)
                    .bold()
                Text(subtitle)
                    .font(.system(size: 32))
                    .foregroundColor(.white)
            }
            .padding(.top, 80)
        }
        .frame(width: UIScreen.main.bounds.width * 3, height: 300)
        .offset(y: -140)
    }
}

#Preview {
    HeaderView(title: "title", subtitle: "subtitle", angle: 15, background: .blue)
}
