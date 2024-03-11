//
//  WeatherSwiftUIApp.swift
//  WeatherSwiftUI
//
//  Created by Миржигит Суранбаев on 1/3/24.
//

import SwiftUI

@main
struct WeatherSwiftUIApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            let weatherService = WeatherService()
            let viewModel = WeatherViewModel(weatherService: weatherService)
            ContentView()
        }
    }
}
