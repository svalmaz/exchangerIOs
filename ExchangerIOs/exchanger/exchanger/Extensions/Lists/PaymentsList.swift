//
//  PaymentsList.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 2/11/24.
//

import SwiftUI

struct PaymentsList: View {
    @State public var paymentList: [Int] = [1,2,3,4,5,6]
    var body: some View {
        
            ScrollView(.horizontal, showsIndicators: false){
                HStack(spacing: 5){
                    ForEach(paymentList, id: \.self){number in
                        if let payment = findPayment(for: number){
                            HStack{
                                TextWithImage(text: payment.paymentName, image: "circle.fill", imageColor: payment.paymentColor, imageSize: 5)
                            }.padding(.horizontal, 10)
                                .padding(.vertical, 3).background(Color.gray.opacity(0.1)) // Фон с непрозрачностью 0.1
                                .cornerRadius(25)
                            
                        }
                        
                    }
                    
                
            }
            
        }
        
    }
}

struct PaymentsList_Previews: PreviewProvider {
    static var previews: some View {
        PaymentsList()
    }
}
