//
//  WeatherCardsView.swift
//  WeatherSwiftUI
//
//  Created by Миржигит Суранбаев on 1/3/24.
//

import SwiftUI

struct PageView: View {
    @Binding var showingPageView: Bool // Добавляем привязку для возможности изменения из вне
    var citiesWeather: [CityWeather] // Передаем данные напрямую
    
    var body: some View {
        NavigationView {
            ZStack {
                Image("backfone")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack{
                    Spacer().frame(height: -30)
                    PageNavigationBar(showingPageView: $showingPageView)
                    ScrollView(.vertical) {
                        VStack(spacing: 10) {
                            ForEach(citiesWeather, id: \.name) { weather in
                                WeatherPageView(cityWeather: weather)
                                    .cornerRadius(20)
                                    .padding(.horizontal)
                            }
                        }
                    }
                }
            }
        }
    }
}


struct WeatherPageView: View {
    var cityWeather: CityWeather
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                Spacer()
                VStack(alignment: .trailing) {
                    Button(action: {
                        print("Delete")
                    }, label: {
                        Image(systemName: "trash")
                            .foregroundColor(.white)
                    })
                    .padding(.top, 5)
                }
            }
            .padding(.trailing)
            
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text("\(cityWeather.temperature)°C")
                        .font(.system(size: 48, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.bottom, 2)
                    Text(cityWeather.name)
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundColor(.white)
                    Text(cityWeather.time)
                        .font(.system(size: 16, weight: .light))
                        .foregroundColor(.white)
                }
                Spacer()
                VStack {
                    Image(systemName: cityWeather.imageName)
                        .renderingMode(.original)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 100, height: 90)
                        .foregroundColor(.white)
                    Text(cityWeather.condition)
                        .font(.system(size: 18))
                        .foregroundColor(.white)
                }
            }
            .padding(.horizontal)
            Divider().background(Color.white)
        }
        .frame(width: 380, height: 170)
        .cornerRadius(10)
        .padding(.horizontal, 10)
    }
}

struct PageNavigationBar: View {
    @Binding var showingPageView: Bool // Привязка к состоянию ContentView
    
    var body: some View {
        HStack(spacing: 12){
            Button(action: {
                print("Print")
            }, label: {
                Image("plus")
            })
            
            Text("Regional Weather")
                .font(.system(size: 32, weight: .semibold))
                .foregroundColor(.white)
            
            Button(action: {
                print("Print")
                showingPageView.toggle() // Переключаем между видами
                
            }, label: {
                Image("menu")
            })
            
        }
    }
}
