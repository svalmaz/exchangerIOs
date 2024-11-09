//
//  OrderModel.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 9/11/24.
//

import Foundation
struct Order : Hashable{
    let id : Int
    let method : String
    let token : String
    let fiat: String
    let price : Double
    let tokenAmount : Double
    let fiatAmount : Double
    let time : String
    let userId1 : Int
    let userId2 : Int
    let username1 : String
    let username2 : String

    let status : String
}
struct GetOrders{
    var ordersList = [Order(id: 1, method: "Buy", token: "USDT", fiat: "KGS", price: 88.5, tokenAmount: 31.05, fiatAmount: 2600.32, time: "10-22 22:47:26", userId1: 1, userId2: 2, username1: "Johan", username2: "Fitzgerald", status: "Completed"), Order(id: 2, method: "Sell", token: "USDT", fiat: "KGS", price: 88, tokenAmount: 4000.05, fiatAmount: 340000.32, time: "10-22 22:47:26", userId1: 1, userId2: 2, username1: "Fitzgerald", username2: "Johan", status: "Completed")]
    func getOrderList() -> [Order]{
        return ordersList
    }
}
