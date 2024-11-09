//
//  ButtonDefaultComands.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 6/11/24.
//

import Foundation
import SwiftUI
extension View{
    func backButtonCommand() -> some View{
        self.modifier(BackButtonModifier())
    }
}
struct BackButtonModifier: ViewModifier{
    @Environment(\.presentationMode) var presentationMode
    func body(content: Content) -> some View {
        content.onTapGesture {
            presentationMode.wrappedValue.dismiss()
        }
    }
}

