//
//  PaymentsModel;.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 2/11/24.
//

import Foundation
import SwiftUI

struct Payment {
    let number: Int
    let paymentName: String
    let paymentColor: Color
}
let data: [Payment] = [
    Payment(number: 1, paymentName: "mBank", paymentColor: Color(hex: "#48acb0")),
    Payment(number: 2, paymentName: "bakai", paymentColor: Color(hex: "#ba9b47")),
    Payment(number: 3, paymentName: "optima", paymentColor: Color(hex: "#9d48b0")),
    Payment(number: 4, paymentName: "demir", paymentColor: Color(hex: "#b04872")),
    Payment(number: 5, paymentName: "О деньги", paymentColor: Color(hex: "#8348b0")),
    Payment(number: 6, paymentName: "KICB", paymentColor: Color(hex: "#4881b0"))
]
func findPayment(for number: Int) -> (paymentName: String, paymentColor: Color)?{
    if let found = data.first(where: {$0.number == number}){
        return (found.paymentName, found.paymentColor)
    }
    else{
        return ("mbank", Color.gray)
    }
}
extension Color {
    init(hex: String) {
        var cleanHexCode = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        cleanHexCode = cleanHexCode.replacingOccurrences(of: "#", with: "")
        print(cleanHexCode)
        var rgb: UInt64 = 0
        
        Scanner(string: cleanHexCode).scanHexInt64(&rgb)
        
        let redValue = Double((rgb >> 16) & 0xFF) / 255.0
        let greenValue = Double((rgb >> 8) & 0xFF) / 255.0
        let blueValue = Double(rgb & 0xFF) / 255.0
        self.init(red: redValue, green: greenValue, blue: blueValue)
    }
}
