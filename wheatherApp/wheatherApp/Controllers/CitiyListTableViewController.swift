//
//  citiyListTableViewController.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 09/05/24.
//

import Foundation
import UIKit

class CitiyListTableViewController: UITableViewController {
    
    var cityViewModel = CityViewModel()
    var weatherViewModel = WeatherViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func openDetail(selectedCity: String) {
        guard let details = weatherViewModel.retireveCityWeather(selectedCity: selectedCity) else {return}
        let detailWeatherViewModel = WeatherDetailViewModel(weatherData: details)
        let detailViewController = DetailViewController(weatherDetailViewModel: detailWeatherViewModel)
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cityViewModel.numberOfRows()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cityViewModel.numberOfSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CitiyCell
        let citiy = cityViewModel.cities[indexPath.row]
        cell.citiy = citiy
        cell.accessoryType = citiy.isFavourite ? .checkmark : .none
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        var City = cityViewModel.cities[indexPath.row]
        tableView.deselectRow(at: indexPath, animated: true)
        tableView.reloadRows(at: [indexPath], with: .automatic)
        let selectedCity = City.name
        self.weatherViewModel.fetchWeatherData(for: City)
        self.weatherViewModel.togleFavourite()
        self.openDetail(selectedCity: selectedCity)
        
    }
}
