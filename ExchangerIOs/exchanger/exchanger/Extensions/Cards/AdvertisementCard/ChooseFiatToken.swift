//
//  ChooseFiatToken.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 9/11/24.
//

import SwiftUI

struct ChooseFiatToken: View {
    @Environment(\.presentationMode) var presentationMode

    @State public var fiatToken : String = ""
    @Binding public var fiatTokenId : Int
    @Binding public var fiatTokenName : String


    var fiatTokensList = FiatTokensListGet()
    var body: some View {
        VStack{
            
            HStack{
                Text("Выберите валюту").fontWeight(.medium)
                Spacer()
                Button(action:{presentationMode.wrappedValue.dismiss()}){
                    Image(systemName: "xmark").foregroundColor(.secondary)
                }
                
                
            }.padding(20)
               

            Divider().background(.gray)
            HStack{
                HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                    TextField("Введите фиатную валюту", text: $fiatToken)
                    Spacer()
                    if fiatToken != "" {
                        Button(action: {fiatToken = ""}){
                            Image(systemName: "x.circle.fill")
                                .resizable()
                                .frame(width:  20, height: 18)
                                .foregroundColor(.gray)
                        }
                    }
                    
                }.padding(10)
                .overlay(RoundedRectangle(cornerRadius: 4).stroke(lineWidth: 1).foregroundColor(.gray))
                .padding(.horizontal, 10)
            }
        ScrollView{
            HStack{
            Text("Все фиатные валюты")
                Spacer()
        }
            .padding(.vertical, 20)
            .padding(.horizontal, 10)
            ForEach(fiatTokensList.getFiatTokensList().filter{
            tokenNameSearch in
                fiatToken.isEmpty || tokenNameSearch.tokenName.localizedCaseInsensitiveContains(fiatToken)
            }, id: \.self){ fiatId in
                Button(action:{fiatTokenId = fiatId.tokenId
                    fiatTokenName = fiatId.tokenName
                    presentationMode.wrappedValue.dismiss()
                }){
                VStack{
                    HStack{
                        Image(fiatId.tokenImageName).resizable().frame(width: 20, height: 20)
                        Text(fiatId.tokenName).fontWeight(.medium)
                            .foregroundColor(.primary)
                            .padding(.horizontal, 10)
                        
                        Spacer()
                        if fiatTokenId == fiatId.tokenId{
                            Image(systemName: "checkmark")
                        }
                        
                    }
                    Divider().background(.gray).opacity(0.2)
                }
                .padding( 5)
            }
            
            }.padding(.horizontal, 10)
                
            
            }
        }
    }
}
