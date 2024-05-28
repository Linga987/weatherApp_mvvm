//
//  WeatherViewModel.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 09/05/24.
//

import Foundation
import UIKit

class WeatherViewModel {
    
    var weatherData: WeatherResponse?
    var weatherArray = [WeatherResponse]()
    var errorMessage: String?
    
    func fetchWeatherData(for city: City) {
        ApiCalling.shared.request(modelType: WeatherResponse.self, type: EndPointsItem.weather(city: city.name )) { [weak self] result in
            switch result {
            case .success(let data):
                self?.weatherData = data
                self?.weatherArray.append(data)
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    }
   /* func fetchWeatherData(for city: City) {
        apiCalling.fetchWeather(for: city.name) { [weak self] result in
            switch result {
            case .success(let data):
                self?.weatherData = data
                self?.weatherArray.append(data)
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
            }
        }
    } */
    
    func retireveCityWeather(selectedCity: String) -> WeatherResponse?  {
        let weatherResponse = weatherArray.first(where: {$0.name == selectedCity})
        return weatherResponse
    }
}


