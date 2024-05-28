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
    var eventHandler: ((_ event: Event) -> Void)? // Data bindiing closure
    
    func fetchWeatherData(for city: City) {
        self.eventHandler?(.loading)
        ApiCalling.shared.request(modelType: WeatherResponse.self, type: EndPointsItem.weather(city: city.name )) { [weak self] result in
            self?.eventHandler?(.stopLoading)
            switch result {
            case .success(let data):
                self?.weatherData = data
                self?.weatherArray.append(data)
                self?.eventHandler?(.dataLoaded)
            case .failure(let error):
                self?.errorMessage = error.localizedDescription
                self?.eventHandler?(.error(error))
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

extension WeatherViewModel {
    enum Event {
        case loading
        case stopLoading
        case dataLoaded
        case error(Error?)
    }
}


