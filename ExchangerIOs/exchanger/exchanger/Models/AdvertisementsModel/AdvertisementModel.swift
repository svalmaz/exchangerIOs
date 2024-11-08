//
//  AdvertisementModel.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 5/11/24.
//

import Foundation

struct AdvertisementModel : Hashable{
    let username : String
    let ordersCount : Int
    let successfulOrders : Int
    let price : Double
    let time : Int
    let volume : Double
    let minVolume : Double
    let maxVolume : Double
    let coin : String
    let method : String
    let paymentsMethod : [Int]
    
}
struct AdvertisementRequest{
    let token : String
    let fiat : String
    let amount : Int
    let method : String
    let paymentsMethod : [Int]
}
struct AdvertisementListGet{
    var advertisementSell = [AdvertisementModel(username: "Agatsuma", ordersCount: 120, successfulOrders: 100, price: 88, time: 15, volume: 1000, minVolume: 165, maxVolume: 1000, coin: "USDT", method: "SELL", paymentsMethod: [1,2,3]),AdvertisementModel(username: "Fitzgerald", ordersCount: 1000, successfulOrders: 98, price: 88.5, time: 30, volume: 100000, minVolume: 2000, maxVolume: 1000, coin: "USDT", method: "SELL", paymentsMethod: [1,5,3]),AdvertisementModel(username: "Agatsuma", ordersCount: 120, successfulOrders: 100, price: 88, time: 15, volume: 1000, minVolume: 165, maxVolume: 1000, coin: "USDT", method: "SELL", paymentsMethod: [1,2,3]),AdvertisementModel(username: "Fitzgerald", ordersCount: 1000, successfulOrders: 98, price: 88.5, time: 30, volume: 100000, minVolume: 2000, maxVolume: 1000, coin: "USDT", method: "SELL", paymentsMethod: [1,5,3]),AdvertisementModel(username: "Agatsuma", ordersCount: 120, successfulOrders: 100, price: 88, time: 15, volume: 1000, minVolume: 165, maxVolume: 1000, coin: "USDT", method: "SELL", paymentsMethod: [1,2,3]),AdvertisementModel(username: "Fitzgerald", ordersCount: 1000, successfulOrders: 98, price: 88.5, time: 30, volume: 100000, minVolume: 2000, maxVolume: 1000, coin: "USDT", method: "SELL", paymentsMethod: [1,5,3])]
    var advertisementBuy = [AdvertisementModel(username: "Agatsuma", ordersCount: 120, successfulOrders: 100, price: 88, time: 15, volume: 1000, minVolume: 165, maxVolume: 1000, coin: "USDT", method: "BUY", paymentsMethod: [1,2,3]),AdvertisementModel(username: "Fitzgerald", ordersCount: 1000, successfulOrders: 98, price: 88.5, time: 30, volume: 100000, minVolume: 2000, maxVolume: 1000, coin: "USDT", method: "BUY", paymentsMethod: [1,5,3])]
    
    func getAds(request: String) -> [AdvertisementModel]{
        
        if request == "Sell"{
            return advertisementSell
        }
        else{
            return advertisementBuy
        }
    }
}
