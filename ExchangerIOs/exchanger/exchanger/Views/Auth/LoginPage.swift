//
//  LoginPage.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 28/6/24.
//

import SwiftUI

struct LoginPage: View {
    @Environment(\.presentationMode) var presentationMode

    @Binding var loginText:  String
    @Binding var passText: String
    @Binding var showAlert : Bool
    @Binding var alertText: String

    var body: some View {
        ZStack{
            
            Color.clear
                           .contentShape(Rectangle())
                           .onTapGesture {
                               UIApplication.shared.endEditing()
                           }
            VStack{
                BackButton(action: {
                    presentationMode.wrappedValue.dismiss()
                }, icon: "xmark").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                Text("Войти").foregroundColor(Color("AuthColor"))
                    .fontWeight(.bold)
                    .font(.system(size: 30))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                    .padding(.top, 50)
                    .padding(.bottom, 10)
                Text("Ваш адресс эл. почты").frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("AuthColor"))
                    .font(.system(size: 14))
                
                    .padding(.horizontal, 20)
                CustomTextField(placeholder: "", text: $loginText, leftIcon: "person.fill", borderColor: Color("MainColor")).padding(.horizontal, 10)
                    .padding(.bottom, 10)
                Text("Пароль").frame(maxWidth: .infinity, alignment: .leading)
                    .foregroundColor(Color("AuthColor"))
                    .font(.system(size: 14))
                
                    .padding(.horizontal, 20)
                CustomTextField(placeholder: "", iconHeight: 20, text: $passText, leftIcon: "lock.fill",  borderColor: Color("MainColor"), isPass: true).padding(.horizontal, 10)                .padding(.bottom, 10)
                
                CommonButton(text: "Войти", action: justTest, textColor: Color("DarkMain"), backColor: Color("LightMain"))  .padding(.horizontal, 10)              .padding(.bottom, 10)
                Button(action: {
                    showAlert.toggle()
                }){
                    Text("Забыли пароль?").foregroundColor(Color("MainColor")).fontWeight(.bold) .overlay(
                        Rectangle()
                            .frame(height: 2)
                            .foregroundColor(Color("MainColor"))
                            .padding(.top, 28)
                        , alignment: .bottom
                    )
                }
                
                Spacer()
                VStack{
                    Text("Или войдите через:").frame(maxWidth: .infinity).foregroundColor(Color("AuthColor"))
                        .padding()
                    HStack{
                        SocialMediaButton(action: justTest, icon: "apple")
                        SocialMediaButton(action: justTest, icon: "facebook")
                        SocialMediaButton(action: justTest, icon: "google")
                    }.padding(.horizontal)
                }
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
    func justTest(){
        if checkTextAuth(text: loginText){
            alertText = "Введите почту"
            showAlert.toggle()
        }
        else if checkTextAuth(text: passText){
            alertText = "Введите пароль"
            showAlert.toggle()
        }
    }
}

