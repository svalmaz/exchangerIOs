//
//  ActiveCard.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 11/11/24.
//

import SwiftUI

struct ActiveCard: View {
    @State public var isActive : Bool = true
    var body: some View {
        HStack{
          
            
            Toggle("Активный режим", isOn: $isActive)
                         .toggleStyle(SwitchToggleStyle(tint: Color("LightMain")))
            
                         
            
            Divider().frame(height: 20).foregroundColor(.gray)
            Text(isActive ? "В сети" : "Не в сети").font(.system(size: 14))
                .foregroundColor(isActive ? .blue : .secondary)
               
                .frame(width: 150)
        }.padding(.vertical, 20)
            .padding(.horizontal, 10)
            .background(Color("MyAdvColor").opacity(0.1))
            .cornerRadius(20)
           

    }
}

struct ActiveCard_Previews: PreviewProvider {
    static var previews: some View {
        ActiveCard()
    }
}
