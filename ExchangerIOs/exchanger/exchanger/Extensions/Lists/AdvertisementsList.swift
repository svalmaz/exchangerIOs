//
//  AdvertisementsList.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 5/11/24.
//

import SwiftUI

struct AdvertisementsList: View {
    @State public var advertisementsList = [1,2,3,4,5,6,7,8,9,10,11,12,13]
    var body: some View {
        ScrollView{
            ForEach(advertisementsList, id: \.self){ads in
                SellBuyCard()
                    .padding(.bottom, 30)
                Divider()
                
            }
        }
    }
}

struct AdvertisementsList_Previews: PreviewProvider {
    static var previews: some View {
        AdvertisementsList()
    }
}
