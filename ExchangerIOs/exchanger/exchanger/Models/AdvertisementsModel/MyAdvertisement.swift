//
//  MyAdvertisement.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 9/11/24.
//

import Foundation
struct myAdvert : Hashable{
    let id : Int
    let userId : Int
    let method : String
    let price : Double
    let tokenAmount : Double
    let token : String
    let fiat : String
    let minVolume : Double
    let maxVolume : Double
    let paymentMethods: [Int]
    let isActive : Bool
    let desc: String
}

struct GetMyAdvertisementsList{
    var myList = [myAdvert(id: 1, userId: 1, method: "Buy", price: 80, tokenAmount: 1000, token: "USDT", fiat: "KGS", minVolume: 165, maxVolume: 1000, paymentMethods: [1,2,3,5], isActive: true, desc: "Just Text"),myAdvert(id: 1, userId: 1, method: "Sell", price: 88, tokenAmount: 1000, token: "USDT", fiat: "KGS", minVolume: 165, maxVolume: 1000, paymentMethods: [4], isActive: true, desc: "Just Text")]
    func getMyAdsList() -> [myAdvert]{
        return myList
    }
}
