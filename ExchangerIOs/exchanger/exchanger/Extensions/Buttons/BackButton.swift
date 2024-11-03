//
//  BackButton.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 28/6/24.
//

import SwiftUI

struct BackButton: View {
    var action: () -> Void
    var icon: String
    var body: some View {
        Button(action: action){
            Image(systemName: icon).resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(Color("MainColor"))
                .frame(width: 16, height: 16)
                .padding()
                .background( Color("BackButtonBackground") )
                .clipShape(Circle())
        }
    }
}
