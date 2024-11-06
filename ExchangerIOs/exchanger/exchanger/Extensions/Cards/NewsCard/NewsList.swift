//
//  NewsList.swift
//  exchanger
//
//  Created by Almaz Saparbaev on 6/11/24.
//

import SwiftUI

struct NewsList: View {
    @State private var currentIndex = 0
       private let numberOfSlides = 3
       private let timer = Timer.publish(every: 10, on: .main, in: .common).autoconnect()
    var body: some View {
        ZStack {
                    TabView(selection: $currentIndex) {
                        ForEach(0..<numberOfSlides, id: \.self) { index in
                            AdvertisementNewsCard(
                                firstText: "Разделите",
                                mainText: "5000 USDT",
                                secondText: "Приглашайте Друзей Торговать Через exchanger и разделите главный приз",
                                imageUrl: "",
                                url: "https://github.com/svalmaz"
                            )
                            .tag(index) // Устанавливаем тег для каждого слайда
                        }
                    }
                    .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never)) // Отключаем встроенный индикатор
                    .frame(height: 80) // Высота слайдера
                    .onReceive(timer) { _ in
                        withAnimation {
                            currentIndex = (currentIndex + 1) % numberOfSlides // Переключаем слайды
                        }
                    }
                    
                    // Индикаторы текущего слайда
                    HStack(spacing: 0) {
                        ForEach(0..<numberOfSlides, id: \.self) { index in
                            Rectangle()
                                .fill(index == currentIndex ? Color.blue : Color.secondary)
                                .frame(width: 20, height: 3)
                        }
                    }
                    .padding(.top, 60)
                }
    }
}

struct NewsList_Previews: PreviewProvider {
    static var previews: some View {
        NewsList()
    }
}
