//
//  ChooseToken.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 6/11/24.
//

import SwiftUI

struct ChooseToken: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding public var token : String
    var body: some View {
        VStack{
            ScrollView{
            HStack{
                Text("Выберите токен").fontWeight(.medium)
                Spacer()
                Button(action:{presentationMode.wrappedValue.dismiss()}){
                    Image(systemName: "xmark").foregroundColor(.secondary)
                }
               
              
            }.padding(20)
            Divider().background(.gray)
            
            Button(action:{token = "USDT"}){
                
           
            HStack{
                Image("USDT").resizable()
                    .frame(width: 18, height: 18)
                   
                Text("USDT").foregroundColor(.primary)
                Spacer()
                if token == "USDT"{
                    Image(systemName: "checkmark").foregroundColor(.blue)
                }
            }
            }
            
            .padding(.horizontal, 20)
            .padding(.vertical, 20)

            
            Button(action:{token = "BTC"}){
                
           
            HStack{
                Image("BTC").resizable()
                    .frame(width: 18, height: 18)
                   
                Text("BTC").foregroundColor(.primary)
                Spacer()
                if token == "BTC"{
                    Image(systemName: "checkmark").foregroundColor(.blue)
                }
            }
            }
            
            .padding(.horizontal, 20)
            .padding(.vertical, 20)

          
                Button(action:{token = "ETH"}){
                    
                    
                    HStack{
                        Image("ETH").resizable()
                            .frame(width: 18, height: 18)
                        
                        Text("ETH").foregroundColor(.primary)
                        Spacer()
                        if token == "ETH"{
                            Image(systemName: "checkmark").foregroundColor(.blue)
                        }
                    }
                
            }
            
            .padding(.horizontal, 20)
            .padding(.top, 20)

           
            }.frame(height: 320)
            

        }
    }
}
