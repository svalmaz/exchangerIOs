//
//  SettingsButton.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 28/6/24.
//

import SwiftUI

struct SettingsButton: View {
    var text: String
    let action: () -> Void
    let icon: String
    @State private var isPressed = false

    var body: some View {
        
           
               
            Button(action:
                action
            ) {
                HStack{
                    HStack{
                        Image(systemName: icon).resizable()
                            .scaledToFit()
                            .foregroundColor(Color("DefaultDW"))
                            .frame(width: 25, height: 25)
                            .padding()
                            .background(isPressed ? Color("SC").opacity(0.3) : Color.gray.opacity(0.2) )
                            .clipShape(Circle())
                        
                        Text(text)
                            .padding(.horizontal, 5)
                            .fontWeight(.bold)
                            .foregroundColor(Color("DefaultDW"))


                            .frame(maxWidth: .infinity, alignment: .leading)
                            .cornerRadius(8)
                        Spacer()
                    }
                    Spacer()
                    Image(systemName: "chevron.right")
                        .foregroundColor(Color("DefaultDW"))
                }.padding()
               
                    .background(isPressed ? Color("SC").opacity(0.2) : Color(UIColor.systemBackground))
                .cornerRadius(15)
            }        .buttonStyle(PlainButtonStyle()) //

            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onChanged { _ in
                       
                            isPressed = true
                        
                    }
                    .onEnded { _ in
                   
                            isPressed = false
                        
                    }
            )
            
       

                  
    }
}

