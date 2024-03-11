//
//  DetailView.swift
//  WeatherSwiftUI
//
//  Created by Миржигит Суранбаев on 1/3/24.
//

import SwiftUI


struct DetailView: View {
    @Binding var showingPageView: Bool // Добавляем привязку для возможности изменения из вне
    
    var citiesWeather: [CityWeather] // Используем моковые данные
    @Environment(\.verticalSizeClass) var verticalSizeClass
    var body: some View {
        NavigationView{
            ZStack{
                Image("page-3")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                VStack(spacing: 0) {
                    DetailNavigationBar(showingPageView: $showingPageView)
                    
                    ScrollView(.horizontal) {
                        HStack(spacing: 10) {
                            ForEach(citiesWeather, id: \.name) { weather in
                                WeatherDetailView(cityWeather: weather)
                                    .containerRelativeFrame(.vertical,
                                                            count: verticalSizeClass == .regular ? 1 : 4,
                                                            spacing: 16)
                                    .scrollTransition { content, phase in content
                                            .opacity(phase.isIdentity ? 1.0 : 0.0)
                                            .scaleEffect(x: phase.isIdentity ? 1.0 : 0.3,
                                                         y: phase.isIdentity ? 1.0 : 0.3)
                                            .offset(y: phase.isIdentity ? 0 : 50)
                                    }
                            }
                            .frame(height: 700) // Установите высоту, если нужно
                        }
                        .scrollTargetLayout()
                    }
                    .contentMargins(12, for: .scrollContent)
                    .scrollTargetBehavior(.viewAligned)
                }
            }
            
        }
    }
}

struct WeatherDetailView: View {
    var cityWeather: CityWeather
    
    var body: some View {
        VStack (alignment: .center, spacing: 0 ) {
            VStack(alignment: .center, spacing: 0){
                // Название города и температура
                Text(cityWeather.name)
                    .font(.system(size: 48, weight: .bold))
                    .foregroundColor(.white)
                HStack(alignment: .top, spacing: 0) {
                    Text("\(cityWeather.temperature)")
                        .font(.system(size: 100, weight: .medium))
                        .foregroundColor(.white)
                        .baselineOffset(20)
                    Text("°C")
                        .font(.system(size: 32, weight: .semibold))
                        .foregroundColor(.white)
                        .padding(.top, 14)
                }
                
                Text("2024 - jan-4") // Предполагаемая дата, замените на актуальную, если она доступна
                    .font(.title3)
                    .foregroundColor(.white)
                    .padding(.bottom, 20)
            }
            // Детальные погодные индикаторы
            
            VStack {
                ZStack {
                    // Внешний бордер (как фон)
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.white) // Цвет бордера
                        .frame(width: 364, height: 178) // Ширина и высота бордера больше на величину толщины бордера
                        .opacity(0.8)
                    
                    
                    
                    // Содержимое с фоном, меньшим, чем внешний бордер
                    RoundedRectangle(cornerRadius: 20)
                        .fill(Color.lightPink) // Цвет фона контента
                        .frame(width: 324, height: 136)
                    
                    
                    HStack(spacing: 10) {
                        
                        HStack() { // Добавь пространство между элементами, если нужно
                            VStack {
                                HStack {
                                    Image(systemName: "sun.max.fill")
                                        .renderingMode(.template)
                                        .foregroundColor(.white)
                                    
                                    Text("UV Index")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white)
                                    
                                }
                                Spacer().frame(height: 16)
                                //                        Text(cityWeather.uvIndex)
                                Text("\(cityWeather.uvIndex)")
                                    .font(.system(size: 22, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity) // Это позволяет элементам равномерно распределяться
                            
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 1, height: 64)
                            
                            
                            VStack {
                                HStack {
                                    Image(systemName: "wind")
                                        .renderingMode(.template)
                                        .foregroundColor(.white)
                                    
                                    Text("Wind")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white)
                                    
                                }
                                Spacer().frame(height: 16)
                                Text("\(cityWeather.wind) m/s")
                                    .font(.system(size: 22, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity) // Это позволяет элементам равномерно распределяться
                            
                            Rectangle()
                                .fill(Color.white)
                                .frame(width: 1, height: 64)
                            
                            VStack {
                                HStack {
                                    Image(systemName: "cloud.sun.fill")
                                        .renderingMode(.template)
                                        .foregroundColor(.white)
                                        .scaledToFit()
                                    
                                    Text("Humidity")
                                        .font(.system(size: 14, weight: .medium))
                                        .foregroundColor(.white)
                                    
                                }
                                Spacer().frame(height: 16)
                                Text("\(cityWeather.humidity)%")
                                    .font(.system(size: 22, weight: .semibold))
                                    .foregroundColor(.white)
                            }
                            .frame(minWidth: 0, maxWidth: .infinity) // Это позволяет элементам равномерно распределяться
                        }
                    }
                    .frame(width: 324,height: 136)
                    .background(Color.lightPink)
                    .cornerRadius(20)
                }
            }
            ZStack {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.white)
                    .frame(width: 364, height: 178)
                    .opacity(0.8)
                
                HourlyForecastView(hourlyTemperatures: [cityWeather.time1, cityWeather.time2, cityWeather.time3, cityWeather.time4, cityWeather.time5])
                    .frame(width: 324, height: 136)
                    .background(Color.lightPink)
                    .cornerRadius(20)
            }
        }.frame(maxWidth: .infinity)
        
        
    }
}

struct HourlyForecastView: View {
    var hourlyTemperatures: [Int]
    var hourlySymbols: [String] = ["sun.max.fill", "cloud.sun.fill", "cloud.rain.fill", "sun.min.fill", "sun.max.fill"] // Добавь соответствующие значки погоды
    
    var body: some View {
        HStack(spacing: 26) {
            ForEach(hourlyTemperatures.indices, id: \.self) { index in
                VStack (spacing: 6) {
                    Text(index == 0 ? "Now" : "\(index * 2 + 10):00") // Подстроим под время, начиная с "Now" и далее каждые два часа
                        .font(.system(size: 15, weight: .medium)) // Настроим шрифт и размер
                        .foregroundColor(.white)
                    
                    
                    Text("\(hourlyTemperatures[index])°")
                        .font(.system(size: 22, weight: .semibold)) // Настроим шрифт и размер для температуры
                        .foregroundColor(.white)
                    
                    Image(systemName: hourlySymbols[index])
                        .renderingMode(.template)
                        .foregroundColor(.white)
                    
                        .scaledToFill()
                        .font(.system(size: 20))
                }
            }
        }
        
    }
}


struct DetailNavigationBar: View {
    @Binding var showingPageView: Bool // Привязка к состоянию ContentView
    @State private var showSearchView = false
    
    var body: some View {
        HStack(alignment: .center){
            NavigationLink(destination: SearchCityView(), isActive: $showSearchView) {
                EmptyView()
            }
            Button(action: {
                self.showSearchView = true
                print("Print")
            }
                   
                   , label: {
                Image("plus")
            }
            )
            .navigationBarBackButtonHidden()
            
            
            Spacer()
            
            HStack {
                Image(systemName: "location.fill")
                    .foregroundColor(.white)
                Text("turn on location")
                    .font(.system(size: 18, weight: .medium))
                    .foregroundColor(.white)
            }
            .padding() // This adds padding around the entire HStack
            .frame(height: 26) // Sets the fixed height of the button
            .background(Color.white.opacity(0.2)) // Use the actual color you need
            .cornerRadius(10) // Adjusts the corner radius for the rounded rectangle
            
            Spacer()
            Button(action: {
                print("Print")
                showingPageView.toggle() // Переключаем между видами
            }, label: {
                Image("menu")
            })
            
        }
        .padding(.horizontal)
    }
}
//
//#Preview {
//    //ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//}
