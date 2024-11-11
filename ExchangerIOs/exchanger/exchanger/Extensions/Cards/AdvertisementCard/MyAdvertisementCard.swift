//
//  MyAdvertisementCard.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 9/11/24.
//

import SwiftUI

struct MyAdvertisementCard: View {
    @State public var myId : Int = 1
    @State public var advert : myAdvert = myAdvert(id: 1, userId: 1, method: "Buy", price: 88, tokenAmount: 1000, token: "USDT", fiat: "KGS", minVolume: 165, maxVolume: 1000, paymentMethods: [1,2,3,4], isActive: true, desc: "Просто текст")
    var body: some View {
        VStack(spacing: 5){
            HStack{
                 
                    Text(advert.method == "Buy" ? "Покупка" : "Продажа").foregroundColor(advert.method == "Buy" ? Color("GreenCustom") : Color("RedCustom"))
                        .fontWeight(.semibold)
                        .font(.system(size: 20))
               
               
                Text(advert.token).fontWeight(.semibold)
                Spacer()
            }
            Divider().foregroundColor(.secondary).padding(.vertical, 10)
            HStack{
                Text("Цена").foregroundColor(.secondary)
                Spacer()
                Text("\(String(format: "%.2f", advert.price)) \(advert.fiat)/\(advert.token)").fontWeight(.semibold)
                    .foregroundColor(Color("WhiteTextColor"))
            }
            HStack{
                Text("Сумма").foregroundColor(.secondary)
                Spacer()
                Text("\(String(format: "%.4f", advert.tokenAmount)) \(advert.token)").fontWeight(.semibold)
                    .foregroundColor(Color("WhiteTextColor"))
            }
           
            HStack{
                Text("Лимиты").foregroundColor(.secondary)
                Spacer()
                Text("\(String(format: "%.1f", advert.minVolume)) - \(String(format: "%.1f", advert.maxVolume)) \(advert.fiat)").fontWeight(.semibold)  .foregroundColor(Color("WhiteTextColor"))
            }
            HStack{
                Text("Способы оплаты:").foregroundColor(.secondary)
                Spacer()
                
            }
            PaymentsList(paymentList: advert.paymentMethods)
            Divider().foregroundColor(.secondary).padding(.vertical, 10)
            HStack{
                Spacer()
                Button(action:{}){
                    HStack{
                        Image(systemName: "arrow.down.to.line").resizable().foregroundColor(.secondary).frame(width: 10, height: 13)
                        Text("Удалить").foregroundColor(.secondary)
                    }}
                Divider().foregroundColor(.secondary)
                    .frame(height: 20)
                Button(action:{}){
                    
                        Image(systemName: "square.and.pencil").resizable().foregroundColor(.secondary).frame(width: 13, height: 13)
                    Text("Изменить").foregroundColor(.secondary)
                }
                
            }
        }.padding(20)
            .background(Color("MyAdvColor").opacity(0.1))
            .cornerRadius(20)
            .padding(.horizontal, 10)
    }
}

struct MyAdvertisementCard_Previews: PreviewProvider {
    static var previews: some View {
        MyAdvertisementCard()
    }
}
