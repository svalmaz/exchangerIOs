//
//  OrdersMain.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 9/11/24.
//

import SwiftUI

struct OrdersMain: View {
    @State private var pageStatusSelection = 1
    var body: some View {
        
        VStack{
            Text("Мои ордера").fontWeight(.semibold)
                
                .font(.system(size: 22))
            HStack{
              
                    HStack(spacing: 20){
                        Button(action:{pageStatusSelection = 1 }){
                            Text("В обработке")
                                .foregroundColor(pageStatusSelection == 1 ? .primary: .secondary)
                                .fontWeight(.semibold)
                        }
                        Button(action:{pageStatusSelection = 2}){
                            Text("История") .foregroundColor(pageStatusSelection == 2 ? .primary: .secondary)
                                .fontWeight(.semibold)
                        }
                        Button(action:{pageStatusSelection = 3}){
                            Text("Все") .foregroundColor(pageStatusSelection == 3 ? .primary: .secondary)
                                .fontWeight(.semibold)
                        }
                        Spacer()
                    }
                 
                
            }.padding(.vertical, 15)
                .padding(.horizontal, 10)
            VStack{
                TabView(selection: $pageStatusSelection){
                    OrdersList().tag(1)
                        .onAppear(){
                            
                        }
                    OrdersList().tag(2)
                        .onAppear(){
                            
                        }
                    OrdersList().tag(3)
                        .onAppear(){
                            
                        }
                   
                }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))}
            
        }.padding(.horizontal, 10)
    }
}

struct OrdersMain_Previews: PreviewProvider {
    static var previews: some View {
        OrdersMain()
    }
}
