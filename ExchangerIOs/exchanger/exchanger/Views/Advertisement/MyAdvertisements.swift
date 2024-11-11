//
//  MyAdvertisements.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 9/11/24.
//

import SwiftUI

struct MyAdvertisements: View {
    @State public var pageIndex = 1
    @State public var isActive : Bool = true
    var body: some View {
        VStack{
            Text("Мои объявления").fontWeight(.semibold)
              
            HStack{
                Button(action:{pageIndex = 1}){
                    Text("Активные") .foregroundColor(pageIndex == 1 ? .primary: .secondary)
                        .fontWeight(.semibold)
                }
                Button(action:{pageIndex = 2}){
                    Text("Все") .foregroundColor(pageIndex == 2 ? .primary: .secondary)
                        .fontWeight(.semibold)
                }.padding(.horizontal, 10)
                Spacer()
            }  .padding(.top, 20)
                .padding(.horizontal, 10)
            ActiveCard()
            TabView(selection: $pageIndex){
                MyAdvertisementsList().tag(1)
                MyAdvertisementsList().tag(2)
            }.tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            Spacer()
        }
    }
}

struct MyAdvertisements_Previews: PreviewProvider {
    static var previews: some View {
        MyAdvertisements()
    }
}
