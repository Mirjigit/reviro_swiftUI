//
//  DataWeather.swift
//  WeatherSwiftUI
//
//  Created by Миржигит Суранбаев on 1/3/24.
//

import Foundation

struct CityWeather {
    let name: String
    let temperature: Int
    let condition, imageName, time: String
    let uvIndex, wind, humidity: Int
    let time1, time2, time3, time4, time5: Int
    
}

let dataWeather = [
    CityWeather(name: "New York", temperature: 4, condition: "Partly Cloudy", imageName: "cloud.sun.fill", time: "17:45 PM", uvIndex: 3, wind: 15, humidity: 65, time1: 6, time2: 10, time3: 14, time4: 18, time5: 22),
    CityWeather(name: "London", temperature: 7, condition: "Rainy", imageName: "cloud.rain.fill", time: "12:00 PM", uvIndex: 1, wind: 10, humidity: 80, time1: 5, time2: 9, time3: 13, time4: 17, time5: 21),
    CityWeather(name: "Tokyo", temperature: 16, condition: "Clear", imageName: "sun.max.fill", time: "11:00 AM", uvIndex: 6, wind: 5, humidity: 50, time1: 7, time2: 11, time3: 15, time4: 19, time5: 23),
    CityWeather(name: "Moscow", temperature: -5, condition: "Snow", imageName: "snow", time: "15:30 PM", uvIndex: 0, wind: 20, humidity: 75, time1: 4, time2: 8, time3: 12, time4: 16, time5: 20)
]
