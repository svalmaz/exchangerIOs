//
//  CustomTextField.swift
//  SalamIOs
//
//  Created by Almaz Saparbaev on 26/6/24.
//

import SwiftUI

struct CustomTextField: View {
    private var textFieldHeight: CGFloat = 30
    private let placeholderText: String
    @Binding private var text: String
    @State private var isEditing = false
    let leftIcon: String?
    let rightIcon: String?
    private var iconHeight: CGFloat = 16
    private var shouldPlaceholderMove: Bool {
        isEditing || (text.count != 0)
    }
    @State private var isSecure: Bool      //Mark: -init

    let borderColor: Color
    public init(placeholder: String, iconHeight: Float? = nil, text: Binding<String>, leftIcon: String? = nil, rightIcon: String? = nil, borderColor: Color, isPass: Bool? = nil) {
        self._text = text
        self.placeholderText = placeholder
        self.leftIcon = leftIcon
        self.rightIcon = rightIcon
        self.iconHeight = CGFloat(iconHeight ?? 16)
        self.borderColor = borderColor
        self.isSecure = isPass ?? false
    }
    @FocusState private var isFocused: Bool
    @State private var isTextVisible: Bool = false

    var body: some View {
        HStack {
            if let leftIcon = leftIcon {
                Image(systemName: leftIcon)
                    
                    .frame(width: 16, height: 16)
                    .aspectRatio(contentMode: .fit)
                    .foregroundColor(isEditing ? borderColor : Color("AuthColor"))
                    .animation(.easeInOut(duration: 0.4), value: isEditing)
            }
            if isSecure{
                if isTextVisible {
                                   TextField("", text: $text)
                                       .focused($isFocused)
                                       .onChange(of: isFocused) { focused in
                                           isEditing = focused
                                       }
                                       .frame(height: textFieldHeight)
                                       .foregroundColor(Color.primary)
                                       .accentColor(borderColor) // cursor color
                                       .animation(.easeInOut(duration: 0.4), value: isEditing)
                               } else {
                                   SecureField("", text: $text)
                                       .focused($isFocused)
                                       .onChange(of: isFocused) { focused in
                                           isEditing = focused
                                       }
                                       .frame(height: textFieldHeight)
                                       .foregroundColor(Color.primary)
                                       .accentColor(borderColor) // cursor color
                                       .animation(.easeInOut(duration: 0.4), value: isEditing)
                               }
              
                    
            }
            else{
                TextField("", text: $text, onEditingChanged: { (edit) in
                    isEditing = edit
                })
                .frame(height: textFieldHeight)
                
                .foregroundColor(Color.primary)
                .accentColor(borderColor) // cursor color
                .animation(.easeInOut(duration: 0.4), value: isEditing)
            }
            Spacer()
            if isSecure {
                           Button(action: {
                               isTextVisible.toggle()
                           }) {
                               Image(systemName: isTextVisible ? "eye.slash.fill" : "eye.fill")
                                                         .frame(width: 18, height: 18)
                                                         .aspectRatio(contentMode: .fit)
                                                         .foregroundColor(.gray)
                                    
                           }
                           .padding(.trailing, 8)
                           .transition(.opacity)
                           .animation(.easeInOut(duration: 0.4), value: isTextVisible)
                       } else if isEditing && !text.isEmpty {
                           Button(action: {
                               withAnimation {
                                   text = ""
                               }
                           }) {
                               Image(systemName: "xmark.circle.fill")
                                   .resizable()
                                   .frame(width: 18, height: 18)
                                   .aspectRatio(contentMode: .fit)
                                   .foregroundColor(.gray)
                           }
                           .padding(.trailing, 8)
                           .transition(.opacity)
                           .animation(.easeInOut(duration: 0.4), value: isEditing && !text.isEmpty)
                       }        }
        .padding()
        .background(Color(UIColor.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 8))
        .overlay {
            RoundedRectangle(cornerRadius: 8)
                .stroke(lineWidth: isEditing ? 3 : 1)
                .foregroundColor(isEditing ? borderColor : Color("AuthColor"))
                .animation(.easeInOut(duration: 0.4), value: isEditing)
        }
       
    }
   
}
