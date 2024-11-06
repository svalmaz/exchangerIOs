//
//  AdvertisementMain.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 5/11/24.
//

import SwiftUI

struct AdvertisementMain: View {
    
     
    @State private var selectedTab = 0
    @State private var buySellButton = true
    @State private var token = "USDT"
    @State private var chooseToken = false
    var body: some View {
        VStack{
           NewsList()
                
            HStack{
                Button(action:{buySellButton = true}){
                    Text("Покупка").fontWeight(.bold)
                        .foregroundColor(buySellButton ? Color("LightMain") : .gray)
                }
                Button(action:{buySellButton = false}){
                    Text("Продажа").fontWeight(.bold)
                        .foregroundColor(!buySellButton ? Color("LightMain") : .gray)
                }.padding(.horizontal, 10)
                Spacer()
                
            }.padding(.horizontal, 20)
            HStack{
                Button(action:{chooseToken.toggle()}){
                    HStack(spacing: 2){
                        Image(token).resizable()
                            .frame(width: 14, height: 14)
                        Text(token).foregroundColor(.primary)
                            .font(.system(size: 14))
                        Image(systemName: "arrowtriangle.down.fill")
                            .resizable()
                            .frame(width: 8, height: 6)
                            .font(.system(size: 9))
                            .foregroundColor(.secondary)
                        Spacer()
                    }.padding(.horizontal, 20)
                }
            }
            Spacer()
        }
        .sheet(isPresented : $chooseToken){
            ChooseToken(token: $token).presentationDetents([.height(320)])
        }
        
    }
}

struct AdvertisementMain_Previews: PreviewProvider {
    static var previews: some View {
        AdvertisementMain()
    }
}
