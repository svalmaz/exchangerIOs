//
//  AuthPageAlert.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 3/7/24.
//

import SwiftUI

struct AuthPageAlert: View {
    @Binding var showAlert: Bool
    @Binding var text: String
        var body: some View {
            VStack {
                HStack {
                    Text(text)
                        .foregroundColor(.white)
                        .padding()
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation {
                            showAlert = false
                        }
                    }) {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .background(Color.red)
                .cornerRadius(10)
                .padding()
                .gesture(
                    DragGesture().onEnded { _ in
                        withAnimation {
                            showAlert = false
                        }
                    }
                )
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                    withAnimation {
                        showAlert = false
                    }
                }
            }
        }
}
