//
//  MyAdvertisementCard.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 9/11/24.
//

import SwiftUI

struct MyAdvertisementCard: View {
    @State public var myId : Int = 1
    @State public var advert : myAdvert = myAdvert(id: 1, method: "Buy", price: 80, tokenAmount: 100, token: "USDT", fiat: "KGS", minVolume: 165, maxVolume: 4000, paymentMethods: [1,2,3])
    var body: some View {
        VStack{
            
        }
    }
}

struct MyAdvertisementCard_Previews: PreviewProvider {
    static var previews: some View {
        MyAdvertisementCard()
    }
}
