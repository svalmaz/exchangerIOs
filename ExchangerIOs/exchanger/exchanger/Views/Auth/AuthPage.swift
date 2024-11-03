//
//  AuthPage.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 1/7/24.
//
import WebKit

import SwiftUI
struct AuthPage: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var showLoginPage = false
    @State private var showRegisterPage = false
    //## Login page details ##
    @State private var loginPageName = ""
    @State private var loginPagePass = ""
    //## Alert Details ##
    @State var showAlert = false
    @State var alertText = "Проверьте данные!"
    var body: some View {
        ZStack{
            VStack {
                
                BackButton(action: {
                    presentationMode.wrappedValue.dismiss()
                }, icon: "xmark").frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 10)
                  
                // Replace "example.gif" with the URL of your GIF
                Spacer()
                
                Image("logo2").resizable()
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(Color("DefaultDW"))
                    .frame(width: 150, height: 150)
                    .padding()
                
                
                Spacer()
                
                Text("Мгновенные переводы без границ и комиссий")
                    .foregroundColor(Color("WhiteTextColor"))
                    .font(.custom("Bartina Bold", size: 40))
                
                
                    .multilineTextAlignment(.center)
                    .padding()
                
                Spacer()
                
                
                HStack {
                    CommonButton(text: "Войти", action: {
                        showLoginPage = true
                        
                    }, textColor: Color.white, backColor: Color("LightMain"))
                    
                    CommonButton(text: "Регистрация", action: {
                        showRegisterPage = true
                        
                    }, textColor:  Color.white, backColor: Color("LightMain"))
                } .padding(.horizontal)
                
                    .padding(.vertical)
                Button(action: {
                    // Action for Apple Sign In
                }) {
                  
                    OneIconButton(text: "Вход с Apple", action:{ justTest() }, textColor: Color("AuthColor"), backColor: Color("BackButtonBackground"), icon: "applelogo")
                }
                .padding(.horizontal)
                
                .padding(.bottom, 30)
                
            }
            .fullScreenCover(isPresented: $showRegisterPage, content:
                                {
                
                RegisterPage( showAlert: $showAlert, alertText: $alertText)
            })
            
            .fullScreenCover(isPresented: $showLoginPage, content: {
                LoginPage(loginText: $loginPageName, passText: $loginPagePass, showAlert: $showAlert, alertText: $alertText)
            })
           
            
        } .background(Color("BackgroundColor"))
            
          
        
    }
    
    func justTest(){
        print("asd")
    }
}

struct AuthPage_Previews: PreviewProvider {
    static var previews: some View {
        AuthPage()
    }
}
