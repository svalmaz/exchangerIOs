//
//  FiatAmount.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 6/11/24.
//

import SwiftUI

struct FiatAmount: View {
    @Environment(\.presentationMode) var presentationMode
    @State public var side : String = "Sell"
    @State public var fiat : String = "KGS"
    @State public var amount : String 
    @Binding public var bindingFiatAmount : String
    @Binding public var changeFiatAmountPage : Bool
    @FocusState public var textFocused : Bool
    var body: some View {
        VStack{
                HStack{
                    Text(side == "Buy" ? "Я хочу купить" : "Я хочу продать").fontWeight(.medium)
                    Spacer()
                    Button(action:{
                       
                       
                        changeFiatAmountPage.toggle()
                        UIApplication.shared.endEditing()
                      }){
                        Image(systemName: "xmark").foregroundColor(.secondary)
                    }
                   
                    
                }.padding(20)
                Divider().background(.gray)
            NumericTextField(text: $amount).focused($textFocused)
            CommonButton(text: "Подтвердить", action: {
                bindingFiatAmount = amount
                changeFiatAmountPage.toggle()
                UIApplication.shared.endEditing()
                }, textColor: .white, backColor: .blue).padding(10)
            
           
            
        }.onAppear(){
            textFocused.toggle()
        }
        .background(Color("DarkWhiteSheet"))
        .frame(height: 250)
        .clipShape(
                       RoundedCornersShape(corners: [.topLeft, .topRight], radius: 25)
                   )
    }
    
}

