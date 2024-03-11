////
////  ContentView.swift
////  WeatherSwiftUI
////
////  Created by Миржигит Суранбаев on 1/3/24.
////

import SwiftUI

struct ContentView: View {
    
    @State private var showingPageView = false
    var citiesWeather = dataWeather // Используем моковые данные
    
    var body: some View {
        VStack {
            if showingPageView {
                PageView(showingPageView: $showingPageView, citiesWeather: citiesWeather)
            } else {
                DetailView(showingPageView: $showingPageView, citiesWeather: citiesWeather) // Ваше основное представление
            }
        }
    }
}

#Preview {
    ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
