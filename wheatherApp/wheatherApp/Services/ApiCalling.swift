//
//  ApiCalling.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 09/05/24.
//

import Foundation

enum ErrorHandling: Error {
    case invalidURL
    case networkError
    case dataParsingError
}

class ApiCalling {
    
    private let apiKey = "e1a9ffb810ecaee17712f28da664dc77"
    private let baseUrl = "https://api.openweathermap.org/data/2.5/weather"
    
    func fetchWeather(for city: String, completionHandler: @escaping(_ result: Result<WeatherResponse, ErrorHandling>) -> Void) {
        guard let urlString = URL(string: "\(baseUrl)?q=\(city)&appid=\(apiKey)&units=metric") else {
            completionHandler(.failure(.invalidURL))
            return
        }
        URLSession.shared.dataTask(with: urlString) { data, response, error in
            if let error = error {
                completionHandler(.failure(.networkError))
                return
            }
            
            guard let data = data else {
                completionHandler(.failure(.dataParsingError))
                return
            }
            
            do {
                let weather = try JSONDecoder().decode(WeatherResponse.self, from: data)
                completionHandler(.success(weather))
            } catch {
                completionHandler(.failure(.dataParsingError))
                print("Error parsing data : \(error.localizedDescription)")
            }
        }.resume()
    
    }
}
