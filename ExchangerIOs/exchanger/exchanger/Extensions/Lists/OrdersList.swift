//
//  OrdersList.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 9/11/24.
//

import SwiftUI

struct OrdersList: View {
    @State public var myId : Int = 1
    @State public var states : String = "Completed"
    var ordersList = GetOrders()
    var body: some View {
        VStack{
            ScrollView{
        ForEach(ordersList.getOrderList(), id: \.self){order in
            OrderCard(order: order)
                .padding(.vertical, 20)
            Divider().foregroundColor(.secondary)
                .overlay(RoundedRectangle(cornerRadius: 1).stroke(lineWidth: 0.1))
        }
            Spacer()
        }}
    }
}

struct OrdersList_Previews: PreviewProvider {
    static var previews: some View {
        OrdersList()
    }
}
