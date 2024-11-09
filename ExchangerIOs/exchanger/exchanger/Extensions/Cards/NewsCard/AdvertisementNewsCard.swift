//
//  AdvertisementNewsCard.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 5/11/24.
//

import SwiftUI

struct AdvertisementNewsCard: View {
    @State var firstText : String = "Разделите "
    @State var mainText : String = "5000 USDT"
    @State var secondText : String = "Приглашайте Друзей Торговать Через exchanger и разделите главный приз"
    @State var imageUrl : String = ""
    @State var url : String = "https://github.com/svalmaz"
    var body: some View {
        HStack{
            VStack{
                HStack(spacing: 5){
                    Text(firstText).fontWeight(.bold)
                        .foregroundColor(Color("WhiteTextColor"))
                    Button(action:{
                        guard let url = URL(string: url) else {
                          return //be safe
                        }
                        UIApplication.shared.openURL(url)

                    }){
                        Text(mainText).fontWeight(.bold)
                            .foregroundColor(Color("LightMain"))
                    }
                    Spacer()
                }
              
                Text(secondText).foregroundColor(.secondary)
                    .font(.system(size: 8))
                    .lineLimit(1)
                

            }
         
            Image("advertisementIcon").resizable()
                .scaledToFit().frame(width: 60,height: 60)
                .padding(.leading, 20)
        }
            .frame(maxWidth: .infinity)
            .padding(.horizontal, 20)
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 10)
                    .stroke(.gray, lineWidth: 0.5))
            .padding(20)
       
         
    }
}

struct AdvertisementNewsCard_Previews: PreviewProvider {
    static var previews: some View {
        AdvertisementNewsCard()
    }
}
