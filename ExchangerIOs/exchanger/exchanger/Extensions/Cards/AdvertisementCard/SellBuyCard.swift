//
//  SellBuyCard.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 2/11/24.
//

import SwiftUI

struct SellBuyCard: View {
    
    @State public var advertisement : AdvertisementModel
    var body: some View {
        VStack{
            HStack{
                Circle()
                           .fill(Color("GreenCustom"))
                           .frame(width: 10, height: 10)
                Text(advertisement.username)
                    .font(.system(size: 18))
                    .foregroundColor(Color("WhiteTextColor"))
                Spacer()
                Text("Сделок: \(advertisement.ordersCount) | \(advertisement.successfulOrders)%").font(.system(size: 11)).foregroundColor(.secondary)
                    .foregroundColor(Color("WhiteTextColor"))
                
                                        
            }
            HStack{
                Text("лв")
                Text("\(String(format: "%.2f", advertisement.price))").fontWeight(.bold)
                    .font(.system(size: 18))
                    .foregroundColor(Color("WhiteTextColor"))
                
                Spacer()
                TextWithImage(text: "\(advertisement.time) минут", image: "clock")
            }.padding(.top, 10)
                .padding(.bottom, 2)
            HStack{
                VStack{
                    HStack{
                        Text("Объем").foregroundColor(.secondary).font(.system(size: 11))
                        
                        Text("\(String(format: "%.6f", advertisement.volume)) \(advertisement.coin)").font(.system(size: 11)).foregroundColor(Color("WhiteTextColor"))
                        Spacer()
                    }
                    HStack{
                        Text("Лимиты").foregroundColor(.secondary).font(.system(size: 11))
                        
                        Text("лв\(String(format: "%.2f", advertisement.minVolume)) - лв\(String(format: "%.2f", advertisement.maxVolume))").font(.system(size: 11)).foregroundColor(Color("WhiteTextColor"))
                        
                        Spacer()
                    }
                }
                VStack{
                    Button(action: {}) {
                        Text(advertisement.method == "BUY" ? "Покупка" : "Продажа").frame(height: 0)
                            .font(.system(size: 14))
                            .foregroundColor(Color.white)
                                   .padding()
                                   
                                   .background(advertisement.method == "BUY" ? Color("GreenCustom") : Color("RedCustom"))
                                   .cornerRadius(5)
                                   
                           }
                    
                           .animation(.easeInOut(duration: 0.4))
                           .transition(.opacity)
                }
                
                    
                
            }
           
            PaymentsList(paymentList: advertisement.paymentsMethod)
            
        }.padding(.horizontal, 20)

    }
}
