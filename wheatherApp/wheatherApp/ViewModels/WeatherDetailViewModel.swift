//
//  WeatherDetailViewModel.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 16/05/24.
//

import Foundation

class WeatherDetailViewModel {
    
    var weatherData: WeatherResponse
    var city: City
    var countryName: String
    var temperature: Double
    var humidity: Int
    
    init(weatherData: WeatherResponse, city: City) {
        self.city = city
        self.weatherData = weatherData
        self.countryName = weatherData.name
        self.temperature = weatherData.main.temp ?? 0.0
        self.humidity = weatherData.main.humidity ?? 0
    }
    
    var cityName: String {
        return city.name
    }
    
    var isFavourite: Bool {
        return city.isFavourite
    }
    
    func toggleFavourite() {
        city.isFavourite.toggle()
    }
    
}
