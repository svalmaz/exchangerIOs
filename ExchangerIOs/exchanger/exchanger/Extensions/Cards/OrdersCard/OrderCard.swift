//
//  OrderCard.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 9/11/24.
//

import SwiftUI

struct OrderCard: View {
    @State private var myId  = 1
    @State public var order : Order = Order(id: 1, method: "Buy", token: "USDT", fiat: "KGS", price: 80, tokenAmount: 1000, fiatAmount: 80000, time: "22-09 22:00", userId1: 1, userId2: 2, username1: "Johan", username2: "Fitzgerald", status: "Completed")
    var body: some View {
        VStack{
            HStack{
                if myId == order.userId1 {
                   
                    Text(order.method == "Buy" ? "Покупка" : "Покупка").foregroundColor(order.method == "Buy" ? Color("GreenCustom") : Color("RedCustom"))
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                }
                else{
                    Text(order.method == "Buy" ? "Продажа" : "Покупка").foregroundColor(order.method != "Buy" ? Color("GreenCustom") : Color("RedCustom"))
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
                }
                Text(order.token).fontWeight(.semibold)
                Spacer()
                Button(action:{}){
                    HStack{
                        
                        switch order.status{
                        case "Completed":
                            Text("Завершено")
                                .foregroundColor(.secondary)
                            
                        case "Declined":
                            Text("Отменено")
                                .foregroundColor(.secondary)
                        case "Processing":
                            Text("В процессе")
                                .foregroundColor(.secondary)
                        default:
                            Text("Завершено")
                                .foregroundColor(.secondary)
                        }
                        Image(systemName:"chevron.right")
                            .resizable()
                            .frame(width: 5, height: 12)
                            .foregroundColor(.secondary)
                        
                    }
                    
                }
            }
            .padding(.vertical, 10)
           
            HStack{
                VStack(alignment: .leading){
                    Text("Цена за ед. \(String(format: "%.2f", order.price)) \(order.fiat)").foregroundColor(.secondary)
                    Text("Количество  \(String(format: "%.2f",order.tokenAmount))").foregroundColor(.secondary)
                    Text("Время \(order.time)").foregroundColor(.secondary)
                }
                Spacer()
                Text("\(String(format: "%.2f", order.fiatAmount)) \(order.fiat)").fontWeight(.bold)
                    .foregroundColor(Color("WhiteTextColor"))
            }
            HStack{
                Button(action:{}){
                    Text(myId == order.userId1 ? order.username1 : order.username2).foregroundColor(Color("WhiteTextColor"))
                    Image(systemName:"chevron.right")
                        .resizable()
                        .frame(width: 5, height: 12)
                        .foregroundColor(.secondary)
                }
                Spacer()
                Button(action:{}){
                    Text("Чат").foregroundColor(Color("WhiteTextColor"))
                        .padding(10)
                        .background(.gray.opacity(0.2))
                        .cornerRadius(8)
                }
            }
        }.padding(.horizontal, 15)
    }
}

struct OrderCard_Previews: PreviewProvider {
    static var previews: some View {
        OrderCard()
    }
}
