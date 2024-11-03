//
//  RegisterVerificationEmail.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 29/6/24.
//

import SwiftUI

struct RegisterVerificationPhone: View {
    var action: () -> Void
    var backButtonAction: () -> Void

    @Binding var otpText : String
    @FocusState private var isKeyboardShowing: Bool
    @Binding var showAlert : Bool
    @Binding var alertText: String

    var body: some View {
        VStack{
            BackButton(action: backButtonAction, icon: "arrow.left").frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
            Text("Проверьте свою почту").foregroundColor(Color("AuthColor"))
                .fontWeight(.bold)
                .font(.system(size: 30))
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal, 10)
                .padding(.top, 20)
                .padding(.bottom, 10)
            Text("Введите код, отправленный на вашу почту").frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color("AuthColor"))
                .font(.system(size: 14))
            
                .padding(.horizontal, 10)
            HStack(spacing: 0){
                ForEach(0..<4, id: \.self){index in
                    OTPTextBox(index)
                }
            }
            .padding(10)
                .background(content: {
                    TextField("", text: $otpText.limit(4))
                        .textContentType(.oneTimeCode)
                        
                        .keyboardType(.numberPad)
                        .frame(width: 1, height: 1)
                        .opacity(0.001)
                        .blendMode(.screen)
                        .focused($isKeyboardShowing)
                       
                      
                })
                .contentShape(Rectangle())
                .onTapGesture {
                    isKeyboardShowing = true
                }
                
            Button(action: {isKeyboardShowing.toggle()}){
                Text("Отправить повторно").foregroundColor(Color("MainColor")).fontWeight(.bold) .overlay(
                    Rectangle()
                        .frame(height: 2)
                        .foregroundColor(Color("MainColor"))
                        .padding(.top, 28)
                    , alignment: .bottom
                )
            }
            Spacer()

            
            CommonButton(text: "Продолжить", action: action, textColor: Color("DarkMain"), backColor: Color("LightMain"))  .padding(.horizontal, 10)              .padding(.bottom, 10)
          
            
        }
        .onAppear(){
            isKeyboardShowing = true
        }            .background(Color("BackgroundColor"))
            .overlay(
                        VStack {
                            if showAlert {
                                AuthPageAlert(showAlert: $showAlert, text: $alertText)
                                    .transition(.move(edge: .top))
                                    .animation(.easeInOut)
                                   
                            }
                            Spacer()
                        }
                        .zIndex(1)
                    )
    }
    func justTest(){
        
    }
    func OTPTextBox(_ index: Int)->some View
    {
        ZStack{
            if otpText.count > index{
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            }
            else{
                Text(" ")
            }
        }
            .frame( width: 60, height: 60)
            .background{
                let status = (isKeyboardShowing && otpText.count == index)
                RoundedRectangle(cornerRadius: 8, style: .continuous).stroke(status ? Color("LightMain") : Color("AuthColor"), lineWidth: status ? 3 : 1 )}
            .frame(maxWidth: .infinity)
            
        
    }
}

extension Binding where Value == String{
    func limit(_ length: Int)-> Self{
        if self.wrappedValue.count > length{
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))

            }
        }
        return self
    }
}
