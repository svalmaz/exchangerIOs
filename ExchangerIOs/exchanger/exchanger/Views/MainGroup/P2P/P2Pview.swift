//
//  P2Pview.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 11/11/24.
//

import SwiftUI

struct P2Pview: View {
    @State public var pageIndex = 1
    @State public var showSelectTab = false
    var body: some View {
        ZStack(alignment: .bottom){
            VStack{
                if pageIndex == 1{
                    AdvertisementMain(changeFiatAmount: $showSelectTab)
                }
                else if pageIndex == 2{
                    OrdersMain()
                }
                else {
                    MyAdvertisements()
                }
            }
            if !showSelectTab{
                HStack(alignment: .bottom){
                    SelectPageCard(pageIndex: $pageIndex).zIndex(1)
                }.padding()
            }
           
        }

    }
}

struct P2Pview_Previews: PreviewProvider {
    static var previews: some View {
        P2Pview()
    }
}
