//
//  EndPointType.swift
//  wheatherApp
//
//  Created by Lingaswami Karingula on 28/05/24.
//

import Foundation

enum HttpMethods: String {
    case get = "GET"
    case post = "POST"
}

protocol EndPointType {
    var apiKey: String { get }
    var city: String { get }
    var baseUrl: String { get }
    var url: URL? { get }
    var method: HttpMethods { get }
}

enum EndPointsItem {
    case weather(city: String)
}

extension EndPointsItem: EndPointType {

    var city: String {
        switch self {
        case .weather(let city):
            return city
        }
    }
    
    var apiKey: String {
        switch self {
        case .weather:
            return "e1a9ffb810ecaee17712f28da664dc77"
        }
    }
    
    var baseUrl: String {
        return "https://api.openweathermap.org/data/2.5/weather"
    }
    
    var url: URL? {
        return URL(string: "\(baseUrl)?q=\(city)&appid=\(apiKey)&units=metric")
    }
    
    var method: HttpMethods {
        switch self {
        case .weather:
            return .get
        }
    }
}


