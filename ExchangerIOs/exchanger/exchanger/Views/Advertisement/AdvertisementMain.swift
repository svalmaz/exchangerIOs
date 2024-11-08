//
//  AdvertisementMain.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 5/11/24.
//

import SwiftUI

struct AdvertisementMain: View {
    
     
    @State private var selectedTab = 0
    @State private var buySellButton = true
    @State private var token = "USDT"
    @State private var chooseToken = false
    @State private var changeFiatAmount = false
    @State private var fiatAmount = ""
    @State private var paymentsList : [Int] = []
    @State private var choosePayment = false
    @State private var methodIndex = 1
    var body: some View {
        ZStack{
            if changeFiatAmount{
                Color.black.opacity(0.01)
                    .zIndex(0.5)
                                    .ignoresSafeArea()
                                    .onTapGesture {
                                        changeFiatAmount = false // Закрываем панель при нажатии на затемнение
                                    }
                                    .transition(.opacity)
                                    .animation(.easeInOut, value: changeFiatAmount)
                           
            }
            if changeFiatAmount {
               
              
                VStack{
                    Spacer()
                    FiatAmount(amount: fiatAmount, bindingFiatAmount: $fiatAmount, changeFiatAmountPage: $changeFiatAmount).frame(height: 250)
                        .background(Color("BackgroundColor"))
                }.transition(.move(edge: .bottom)).zIndex(1)
              
            }
        VStack{
            
           NewsList()
                
            HStack{
                Button(action:{buySellButton = true
                    methodIndex = 1
                }){
                    Text("Покупка").fontWeight(.bold)
                        .foregroundColor(methodIndex == 1 ? Color("LightMain") : .gray)
                }
                Button(action:{buySellButton = false
                    methodIndex = 2
                }){
                    Text("Продажа").fontWeight(.bold)
                        .foregroundColor(methodIndex != 1 ? Color("LightMain") : .gray)
                }.padding(.horizontal, 10)
                Spacer()
                
            }.padding(.horizontal, 20)
            HStack{
                Button(action:{chooseToken.toggle()
                    changeFiatAmount = false
                }){
                    HStack(spacing: 2){
                        Image(token).resizable()
                            .frame(width: 14, height: 14)
                        Text(token).foregroundColor(.primary)
                            .font(.system(size: 14))
                        Image(systemName: "arrowtriangle.down.fill")
                            .resizable()
                            .frame(width: 8, height: 6)
                            .font(.system(size: 9))
                            .foregroundColor(.secondary)
                       
                    }.padding(.horizontal, 20)
                       
                    
                }
                Button(action:{changeFiatAmount.toggle()}){
                    HStack(spacing: 2){
                        
                        Text("Сумма").foregroundColor(fiatAmount != "" ? .blue : .primary)
                            .font(.system(size: 14))
                        Image(systemName: "arrowtriangle.down.fill")
                            .resizable()
                            .frame(width: 8, height: 6)
                            .font(.system(size: 9))
                            .foregroundColor(.secondary)
                    
                    }
                    
                    
                }
                Button(action:{choosePayment.toggle()}){
                    HStack(spacing: 2){
                        
                        Text("Оплата").foregroundColor(!paymentsList.isEmpty  ? .blue : .primary)
                            .font(.system(size: 14))
                        Image(systemName: "arrowtriangle.down.fill")
                            .resizable()
                            .frame(width: 8, height: 6)
                            .font(.system(size: 9))
                            .foregroundColor(.secondary)
                        Spacer()
                    }.padding(.horizontal, 20)
                    
                    
                }
                
                Spacer()
                
            }
            .padding(.vertical, 10)
            Divider().background(.gray)
            VStack{
                TabView(selection: $methodIndex){
                    AdvertisementsList(advertisementRequest: AdvertisementRequest(token: "USDT", fiat: "KGS", amount: 10000, method: "Sell", paymentsMethod: [1,2,3,4])).tag(1)
                    AdvertisementsList(advertisementRequest: AdvertisementRequest(token: "USDT", fiat: "KGS", amount: 10000, method: "Buy", paymentsMethod: [1,2,3,4])).tag(2)
                    
                }  .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
                
            }
            Spacer()
           
           
        }        .background(changeFiatAmount ? Color("WhiteTextColor").opacity(0.05) : Color("Backgroundcolor"))
                .zIndex(0)

        .disabled(changeFiatAmount)
               
    
        .sheet(isPresented : $chooseToken){
            ChooseToken(token: $token).presentationDetents([.height(320)])
        }
        .sheet(isPresented: $choosePayment){
            PaymentsCard(bindingPaymentList:  paymentsList, bindingMainPaymentsList: $paymentsList).presentationDetents([.height(520)])
        }
            
           
        }
    }
}

struct AdvertisementMain_Previews: PreviewProvider {
    static var previews: some View {
        AdvertisementMain()
    }
}
