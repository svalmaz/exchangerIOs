//
//  NumericTextField.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 7/11/24.
//

import SwiftUI

struct NumericTextField: View {
    @Binding public var text : String
    @State public var placeholderText : String = "лв0.00"
    @State public var fiat : String = "KGS"

    var body: some View {
        HStack{
            TextField(placeholderText, text: $text).keyboardType(.numberPad)
                .padding(.horizontal, 10)
            Spacer()
            if text != ""{
                Button(action: {
                    withAnimation {
                        text = ""
                    }
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 18, height: 18)
                        .aspectRatio(contentMode: .fit)
                        .foregroundColor(.gray)
                }
                .padding(.trailing, 8)
                .transition(.opacity)
               
            }
            Text(fiat)
                .padding(.horizontal, 10)
            
        }.frame(height: 50).overlay(RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 1.5)
            .foregroundColor(Color("LightMain")))
        .padding(10)
    }
}
