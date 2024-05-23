//
//  CityViewModel.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 17/05/24.
//

import Foundation

class CityViewModel {
   private var cities: [City] = []
   var searchNames = [City]()
    
    init() {
        let cityNames = ["New York", "London", "Brazil", "Paris", "Tokyo","Bengaluru"]
        cities = cityNames.map { City(name: $0, isFavourite: false) }
    }
    
    var sortedCities: [City] {
        return cities.sorted {$0.name < $1.name }
    }
    
    func numberOfSection() -> Int {
        return sortedCities.count
    }
    
    func numberOfRows() -> Int {
        return sortedCities.count
    }
    
    func toggleFavourite(city: City) {
        if let index = cities.firstIndex(where: { $0.name == city.name}) {
            cities[index].isFavourite.toggle()
        }
    }
    
    func isFavourite(city: City) -> Bool {
        return cities.first(where: { $0.name == city.name })?.isFavourite ?? false
    }
    
    func retrieveSearchNames(searchText: String) {
        searchNames = sortedCities.filter({$0.name.lowercased().prefix(searchText.count) == searchText.lowercased() })
    }
    
  }

