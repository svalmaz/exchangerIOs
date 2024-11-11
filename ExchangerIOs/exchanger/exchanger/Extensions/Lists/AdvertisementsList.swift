//
//  AdvertisementsList.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 5/11/24.
//

import SwiftUI

struct AdvertisementsList: View {
    @State public var advertisementRequest : AdvertisementRequest = AdvertisementRequest(token: "USDT", fiat: "KGS", amount: 1000, method: "Sell", paymentsMethod: [1,2,3,4])
        let adsGet = AdvertisementListGet()
    var body: some View {
        ScrollView{
                
            ForEach(adsGet.getAds(request: advertisementRequest.method) , id: \.self){ads in
                    SellBuyCard(advertisement: ads)
                        .padding(.bottom, 30)
                Divider().foregroundColor(.secondary)
                    .overlay(RoundedRectangle(cornerRadius: 1).stroke(lineWidth: 0.1))
                    
                }
            
          
        }
    }
}

struct AdvertisementsList_Previews: PreviewProvider {
    static var previews: some View {
        AdvertisementsList()
    }
}
