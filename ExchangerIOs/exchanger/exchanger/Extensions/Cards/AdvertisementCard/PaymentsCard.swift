//
//  PaymentsCard.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 7/11/24.
//

import SwiftUI

struct PaymentsCard: View {
    
    @State public var paymentList : [Int] = [1,2,3,4,5]
    @State public var bindingPaymentList : [Int] = []
    @Environment(\.presentationMode) var presentationMode
    @Binding public var bindingMainPaymentsList : [Int]
    var body: some View {
        VStack{
            
                HStack{
                    Text("Выберите метод оплаты").fontWeight(.medium)
                    Spacer()
                    Button(action:{presentationMode.wrappedValue.dismiss()}){
                        Image(systemName: "xmark").foregroundColor(.secondary)
                    }
                    
                    
                }.padding(20)
                   

                Divider().background(.gray)
            ScrollView{
                Button(action:{
                    if bindingPaymentList.isEmpty{
                        
                    }
                    else{
                        bindingPaymentList = []
                    }
                }){
                    HStack{
                        Label {
                            Text("Все").foregroundColor(bindingPaymentList.isEmpty ? .blue : Color("AuthColor"))
                                .font(.system(size:CGFloat(18)))
                                .fontWeight((bindingPaymentList.isEmpty ? .semibold : .regular))
                            
                            
                            
                        } icon: {
                            Image(systemName: "circle.fill")
                                .foregroundColor(Color.blue)
                                .font(.system(size:CGFloat(5)))
                        }
                      
                        
                        Spacer()
                    }
                   
                    .padding(20)
                    .background(bindingPaymentList.isEmpty ? Color("PaymentsBackgroundColor").opacity(0.2) : Color("BackgroundColor"))
                    
                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
                        .foregroundColor(bindingPaymentList.isEmpty ? Color("LightMain") : Color.gray))
                    .cornerRadius(8)
                
                    
                    
                    
                    
                    
                }
                
                VStack{
                    ForEach(paymentList, id: \.self){
                        number in
                        if let  pay = findPayment(for: number){
                            
                            HStack{
                                Button(action:{
                                    
                                    if bindingPaymentList.contains(number){
                                        bindingPaymentList.removeAll{$0 == number }
                                    }
                                    else{
                                        bindingPaymentList.append(number)
                                        
                                    }
                                    
                                }){
                                    HStack{
                                        Label {
                                            Text(pay.paymentName).foregroundColor(bindingPaymentList.contains(number) ? Color("LightMain") : Color("AuthColor"))
                                                .font(.system(size:CGFloat(18)))
                                                .fontWeight(bindingPaymentList.contains(number) ? .semibold : .none)
                                            
                                            
                                        } icon: {
                                            Image(systemName: "circle.fill")
                                                .foregroundColor(pay.paymentColor)
                                                .font(.system(size:CGFloat(5)))
                                        }
                                        
                                        Spacer()
                                    }
                                    .padding(20)
                                    .background(bindingPaymentList.contains(number) ? Color("LightMain").opacity(0.1) : Color("BackgroundColor"))
                                    
                                    .overlay(RoundedRectangle(cornerRadius: 8).stroke(lineWidth: 1)
                                        .foregroundColor(bindingPaymentList.contains(number) ? Color("LightMain") : Color.gray))
                                    .cornerRadius(8)
                                    
                                    
                                    
                                    
                                    
                                }
                                
                            }
                        }
                    }
                    }
                }                .padding(.horizontal, 10)

                HStack{
                    Button(action:{bindingPaymentList = []
                        bindingMainPaymentsList = bindingPaymentList
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Text("Сбросить").foregroundColor(.primary)
                            .padding(10)
                      
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                        
                            .background(.gray.opacity(0.2))
                            .cornerRadius(5)
                            
                    }
                    Button(action:{bindingMainPaymentsList = bindingPaymentList
                        presentationMode.wrappedValue.dismiss()
                    }
                    ){
                        Text("Подтвердить").foregroundColor(.white)
                            .padding(10)
                      
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                        
                            .background(.blue)
                            .cornerRadius(5)
                            
                    }
                    
                   
                }
                .padding(.top, 20)
                .padding(.horizontal, 10)

            }
            
            
            
        
    }
}
