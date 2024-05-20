//
//  WeatherViewModel.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 09/05/24.
//

import Foundation
import UIKit

class WeatherViewModel {
    
    var selectedCity: City?
    var weatherData: WeatherResponse?
    var weatherArray = [WeatherResponse]()
    var apiCalling = ApiCalling()
    
    
    func fetchWeatherData(for city: City) {
        selectedCity = city
        apiCalling.fetchWeather(for: city.name) { [weak self] result in
            switch result {
            case .success(let data):
                self?.weatherData = data
                self?.weatherArray.append(data)
                print("\(self?.weatherData?.main.temp): dcccsxcsxc")
                print("\(self?.weatherData?.name):gggthrte")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func retireveCityWeather(selectedCity: String) -> WeatherResponse?  {
        let weatherResponse = weatherArray.first(where: {$0.name == selectedCity})
        return weatherResponse
    }
    
    func togleFavourite() {
        guard var city = selectedCity else { return }
        city.isFavourite.toggle()
    }
}

