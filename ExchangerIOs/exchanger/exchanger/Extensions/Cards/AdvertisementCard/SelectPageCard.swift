//
//  SelectPageCard.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 11/11/24.
//

import SwiftUI

struct SelectPageCard: View {
    @Binding public var pageIndex : Int 
    var body: some View {
        HStack{
            Button(action:{pageIndex = 1}){
                VStack{
                   
                    Image("p2p").resizable().renderingMode(.template).frame(width: 15, height: 15).foregroundColor(pageIndex == 1 ? Color("LightMain") : .primary)
                    Text("P2P")
                    
                        .foregroundColor(pageIndex == 1 ? Color("LightMain") : .primary)
                        .font(.system(size: 10))
                }
              
            }
            Spacer()
            Button(action:{pageIndex = 2}){
                
                VStack{
                  
                    Image("order").resizable().renderingMode(.template).frame(width: 20, height: 20).foregroundColor(pageIndex == 2 ? Color("LightMain") : .primary)
                    Text("Ордера")
                        
                        .foregroundColor(pageIndex == 2 ? Color("LightMain") : .primary)
                        .font(.system(size: 10))
                }
               
            }
            Spacer()
            Button(action:{pageIndex = 3}){
                
                VStack{
                   
                    Image("ads").resizable().renderingMode(.template).frame(width: 20, height: 20).foregroundColor(pageIndex == 3 ? Color("LightMain") : .primary)
                    Text("Объявления")
                        
                        .foregroundColor(pageIndex == 3 ? Color("LightMain") : .primary)
                        .font(.system(size: 10))
                }
               
            }
        }
       
        .padding(.horizontal, 30)
        .padding(.vertical, 10)
        .overlay(RoundedRectangle(cornerRadius: 33).stroke(lineWidth: 1).foregroundColor(Color.primary.opacity(0.3)))
        .background(Color("SelectPageColor"))
        .cornerRadius(33)
        .padding(.horizontal, 20)
        
    }
}

