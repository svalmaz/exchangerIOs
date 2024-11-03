//
//  RegisterPageFinal.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 30/6/24.
//

import SwiftUI

struct RegisterPageFinal: View {
    var action: () -> Void
    var backButtonAction: () -> Void

    @Binding var passText : String
    @Binding var nameText : String
    @Binding var showAlert : Bool
    @Binding var alertText: String

    var body: some View {
        ZStack{
            Color.clear.contentShape(Rectangle())
                .onTapGesture {
                    UIApplication.shared.endEditing()
                }
            VStack{
                BackButton(action: backButtonAction, icon: "arrow.left").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                Text("Пароль").frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("AuthColor"))
                    .font(.system(size: 14))
                
                    .padding(.horizontal, 20)
                CustomTextField(placeholder: "", iconHeight: 20, text: $passText, leftIcon: "lock.fill",  borderColor: Color("MainColor"), isPass: true).padding(.horizontal, 10)
                    .padding(.bottom, 10)
                Text("Ваше имя").frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("AuthColor"))
                    .font(.system(size: 14))
                
                    .padding(.horizontal, 20)
                CustomTextField(placeholder: "", text: $nameText, leftIcon: "person.fill", borderColor: Color("MainColor")).padding(.horizontal, 10)
                    .padding(.bottom, 10)
                CommonButton(text: "Зарегистрироваться", action: action, textColor: Color("DarkMain"), backColor: Color("LightMain"))  .padding(.horizontal, 10)              .padding(.bottom, 10)
                Spacer()
            }
        }            .background(Color("BackgroundColor"))

    }
    func justTest(){
        print("asd")
    }
}

