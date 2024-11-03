//
//  CommonButton.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 28/6/24.
//

import SwiftUI

struct CommonButton: View {
    var text: String
    let action: () -> Void
    let textColor: Color
    let backColor: Color
    
    var body: some View {
        Button(action: action) {
                   Text(text)
                       .fontWeight(.bold)
                       .foregroundColor(textColor)
                       .padding()
                       .frame(maxWidth: .infinity)
                       .background(backColor)
                       .cornerRadius(25)
               }
              
               .animation(.easeInOut(duration: 0.4))
               .transition(.opacity)
    }
}

