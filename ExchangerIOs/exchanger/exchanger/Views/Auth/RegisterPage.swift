//
//  RegisterPage.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 29/6/24.
//

import SwiftUI

struct RegisterPage: View {
    @State private var showLoading = false
        @State private var currentView: Int = 0
        @State private var emailText = ""
        @State private var passText = ""
        @State private var nameText = ""
        @State private var otpText = ""
    @Environment(\.presentationMode) var presentationMode
    @State private var goBack =  true
    @Binding var showAlert : Bool
    @Binding var alertText: String

        var body: some View {
            ZStack {
                if currentView == 0 {
                    RegisterPageEmail(action: {
                        goBack = false
                        if checkTextAuth(text: emailText){
                            alertText = "Некорректно введен номер!"
                            showAlert.toggle()
                            
                        }
                        else{
                            showLoadingScreen(nextView: 1)
                        }
                       
                        
                    }, backButtonAction: {
                        presentationMode.wrappedValue.dismiss()


                    }, emailText: $emailText, passText: $passText, nameText: $nameText, showAlert: $showAlert, alertText: $alertText)
                    .transition(!goBack ? .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)) : .slide)
                } else if currentView == 1 {
                    RegisterVerificationPhone(action: {
                        goBack = false
                        if checkTextAuth(text: otpText){
                            alertText = "Введите код!"
                            showAlert.toggle()
                        }
                        else{
                            showLoadingScreen(nextView: 2)
                        }
                    }, backButtonAction: {
                        goBack = true

                        showLoadingScreen(nextView: 0)

                    }, otpText: $otpText, showAlert: $showAlert, alertText: $alertText)
                    .transition(!goBack ? .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)) : .slide)
                } else if currentView == 2 {
                    RegisterPageFinal(action: {
                        goBack = false
                        if checkTextAuth(text: nameText){
                            alertText = "Введите имя"
                            showAlert.toggle()
                        }
                       else if checkTextAuth(text: passText){
                            alertText = "Введите пароль"
                            showAlert.toggle()
                        }
                        else{
                            showLoadingScreen(nextView: 3)
                        }
                    }, backButtonAction: {
                        goBack = true

                        showLoadingScreen(nextView: 0)

                    }, passText: $passText, nameText: $nameText, showAlert: $showAlert, alertText: $alertText)
                    .transition(!goBack ? .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading)) : .slide)
                }
                if showLoading {
                    ZStack {
                                      BlurView(style: .systemMaterial)
                                          .edgesIgnoringSafeArea(.all)
                                      Color.white.opacity(0.2)
                                          .edgesIgnoringSafeArea(.all)
                                      LoadingView()
                                  }
                                  .transition(.opacity)
                }
            }            .background(Color("BackgroundColor"))

            .animation(.easeInOut, value: currentView)
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

        func showLoadingScreen(nextView: Int) {
            withAnimation {
                showLoading = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                withAnimation {
                 
                    currentView = nextView
                    
                    showLoading = false

                }
            }
        }
}

struct LoadingView: View {
    var body: some View {
        VStack {
                   ProgressView()
                       .progressViewStyle(CircularProgressViewStyle(tint: Color("MainColor")))
                       .scaleEffect(2)
               }
    }
}

struct BlurView: UIViewRepresentable {
    var style: UIBlurEffect.Style

    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
