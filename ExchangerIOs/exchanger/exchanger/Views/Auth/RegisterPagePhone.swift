//
//  RegisterPage.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 29/6/24.
//

import SwiftUI

struct RegisterPageEmail: View {
    var action: () -> Void
    var backButtonAction: () -> Void

    @Binding var emailText: String
    @Binding var passText: String
    @Binding var nameText: String
    @Binding var showAlert : Bool
    @Binding var alertText: String

    var body: some View {
        ZStack{
            Color.clear.contentShape(Rectangle())
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            VStack{
                BackButton(action: backButtonAction, icon: "xmark").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                Text("Для регистрации введите ваш номер телефона").foregroundColor(Color("AuthColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    .padding(.top, 20)
                    .padding(.bottom, 10)
                Text("Ваш номер").frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("AuthColor"))
                    .font(.system(size: 14))
                
                    .padding(.horizontal, 20)
                CustomTextField(placeholder: "", text: $emailText, leftIcon: "phone", borderColor: Color("MainColor")).padding(.horizontal, 10)
                    .padding(.bottom, 10)
                Spacer()
                Text(buildAttributedString())
                                   .font(.footnote)
                                   .padding()
            
                CommonButton(text: "Продолжить", action: action, textColor: Color("DarkMain"), backColor: Color("LightMain"))  .padding(.horizontal, 10)             .padding(.bottom, 10)
                    .padding(.vertical, 10)
            }
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
    private func buildAttributedString() -> AttributedString {
           var attributedString = AttributedString("Регистрируясь, вы принимаете наши Условия использования и Политику конфиденциальности.")
           
           if let termsRange = attributedString.range(of: "Условия использования") {
               attributedString[termsRange].link = URL(string: "https://yourtermslink.com")
               attributedString[termsRange].foregroundColor = Color("LightMain")
               attributedString[termsRange].underlineStyle = .single
           }
           
           if let privacyRange = attributedString.range(of: "Политику конфиденциальности") {
               attributedString[privacyRange].link = URL(string: "https://yourpolicylink.com")
               attributedString[privacyRange].foregroundColor = Color("LightMain")
               attributedString[privacyRange].underlineStyle = .single
           }
           
           return attributedString
       }
    func justTest(){
        print("asd")
    }
func openLink(_ url: String) {
        guard let link = URL(string: url) else { return }
        UIApplication.shared.open(link)
    }
}
