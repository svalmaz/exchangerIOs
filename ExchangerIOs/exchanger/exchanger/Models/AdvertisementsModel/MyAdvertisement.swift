//
//  MyAdvertisement.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 9/11/24.
//

import Foundation
struct myAdvert{
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
    let isAcrive : Bool
    let desc: String
}

