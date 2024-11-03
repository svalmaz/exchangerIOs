//
//  SellBuyCard.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 2/11/24.
//

import SwiftUI

struct SellBuyCard: View {
    @State public var username : String = "Agatsuma"
    @State public var ordersCount: Int = 100
    @State public var successfulOrders: Int = 100
    @State public var price: Double = 88.5
    @State public var time: Int = 15
    @State public var volume: Double = 1000.555
    @State public var minVolume: Double = 100
    @State public var maxVolume: Double = 1000.555
    
    @State public var coin : String = "USDT"
    @State public var method: String = "BUY"
    var body: some View {
        VStack{
            HStack{
                Circle()
                           .fill(Color("GreenCustom"))
                           .frame(width: 10, height: 10)
                Text(username)
                    .font(.system(size: 18))
                    .foregroundColor(Color("WhiteTextColor"))
                Spacer()
                Text("Сделок: \(ordersCount) | \(successfulOrders)%").font(.system(size: 11)).foregroundColor(.secondary)
                    .foregroundColor(Color("WhiteTextColor"))
                
                                        
            }
            HStack{
                Text("лв")
                Text("\(String(format: "%.2f", price))").fontWeight(.bold)
                    .font(.system(size: 18))
                    .foregroundColor(Color("WhiteTextColor"))
                
                Spacer()
                TextWithImage(text: "\(time) минут", image: "clock")
            }.padding(.top, 10)
                .padding(.bottom, 2)
            HStack{
                VStack{
                    HStack{
                        Text("Объем").foregroundColor(.secondary).font(.system(size: 11))
                        
                        Text("\(String(format: "%.6f", volume)) \(coin)").font(.system(size: 11)).foregroundColor(Color("WhiteTextColor"))
                        Spacer()
                    }
                    HStack{
                        Text("Лимиты").foregroundColor(.secondary).font(.system(size: 11))
                        
                        Text("лв\(String(format: "%.2f", minVolume)) - лв\(String(format: "%.2f", maxVolume))").font(.system(size: 11)).foregroundColor(Color("WhiteTextColor"))
                        
                        Spacer()
                    }
                }
                VStack{
                    Button(action: {}) {
                        Text(method == "BUY" ? "Покупка" : "Продажа").frame(height: 0)
                            .font(.system(size: 14))
                            .foregroundColor(Color.white)
                                   .padding()
                                   
                                   .background(method == "BUY" ? Color("GreenCustom") : Color("RedCustom"))
                                   .cornerRadius(5)
                                   
                           }
                    
                           .animation(.easeInOut(duration: 0.4))
                           .transition(.opacity)
                }
                
                    
                
            }
           
            PaymentsList()
            
        }.padding(.horizontal, 20)

    }
}

struct SellBuyCard_Previews: PreviewProvider {
    static var previews: some View {
        SellBuyCard()
    }
}
