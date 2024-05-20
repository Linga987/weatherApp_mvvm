//
//  WeatherDetailViewModel.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 16/05/24.
//

import Foundation

class WeatherDetailViewModel {
    
    var weatherData: WeatherResponse
    var countryName: String
    var temperature: Double
    var humidity: Int
    
    init(weatherData: WeatherResponse) {
        self.weatherData = weatherData
        self.countryName = weatherData.name
        self.temperature = weatherData.main.temp ?? 0.0
        self.humidity = weatherData.main.humidity ?? 0
    }
    
}
