//
//  TextWithImage.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 2/11/24.
//

import SwiftUI

struct TextWithImage: View {
    @State public var text: String = "string"
    @State public var image: String = "circle.fill"
    @State public var imageColor: Color = Color.gray
    @State public var textSize: Int = 11
    @State public var imageSize: Int = 11
    var body: some View {
        Label {
            Text(text).foregroundColor(.gray).font(.system(size:CGFloat(textSize)))
        } icon: {
                  Image(systemName: image)
                      .foregroundColor(imageColor)
                      .font(.system(size:CGFloat(imageSize)))
              }    }
}

struct TextWithImage_Previews: PreviewProvider {
    static var previews: some View {
        TextWithImage()
    }
}
