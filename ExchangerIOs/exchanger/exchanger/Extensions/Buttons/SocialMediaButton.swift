//
//  SocialMediaButton.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 29/6/24.
//

import SwiftUI

struct SocialMediaButton: View {
    let action: () -> Void
    let icon : String
    var body: some View {
        Button(action: action){
            if icon == "apple"{
                Image(systemName: "apple.logo").resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("DefaultDW"))
                    .frame(width: 16, height: 16)
                    .padding()
                  
                    .cornerRadius(25)
            }
            else{
                Image(icon).resizable()
                    .aspectRatio(contentMode: .fit)
                
                    .frame(width: 16, height: 16)
                    .padding()
                
                    .cornerRadius(25)
            }
        }
        .frame(maxWidth: .infinity)
        .background(Color.clear)
        .overlay(
            RoundedRectangle(cornerRadius: 25)
                .stroke(Color("AuthColor"), lineWidth: 2) // серая граница
        )
            
    }
}
