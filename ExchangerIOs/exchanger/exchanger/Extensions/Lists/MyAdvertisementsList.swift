//
//  MyAdvertisementsList.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 11/11/24.
//

import SwiftUI

struct MyAdvertisementsList: View {
    let myAdvert = GetMyAdvertisementsList()
    var body: some View {
        VStack{
            ScrollView{
            ForEach(myAdvert.getMyAdsList(), id: \.self){advert in
                MyAdvertisementCard(advert: advert)
                
            }}
        }
    }
}

struct MyAdvertisementsList_Previews: PreviewProvider {
    static var previews: some View {
        MyAdvertisementsList()
    }
}
