//
//  WeatherResponse.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 09/05/24.
//

import Foundation

struct WeatherResponse: Codable {
    var main: Weather
    var name: String
}

struct Weather: Codable {
    var temp: Double?
    var humidity: Int?
}

struct City {
    let name: String
    var isFavourite: Bool
}
