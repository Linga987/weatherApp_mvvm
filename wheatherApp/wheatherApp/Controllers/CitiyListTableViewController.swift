//
//  citiyListTableViewController.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 09/05/24.
//

import Foundation
import UIKit

class CitiyListTableViewController: UITableViewController {
    
    @IBOutlet weak var searchBar: UISearchBar!
    var cityViewModel = CityViewModel()
    var weatherViewModel = WeatherViewModel()
    var isSearching = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func openDetail(selectedCity: String, city: City) {
        guard let details = weatherViewModel.retireveCityWeather(selectedCity: selectedCity) else { return }
        let detailWeatherViewModel = WeatherDetailViewModel(weatherData: details, city: city)
        let detailViewController = DetailViewController(weatherDetailViewModel: detailWeatherViewModel)
        detailViewController.delegate = self
        self.navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearching {
            return cityViewModel.searchNames.count
        } else {
            return cityViewModel.numberOfRows()
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return cityViewModel.numberOfSection()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CitiyCell
        if isSearching {
            let city = cityViewModel.searchNames[indexPath.row]
            cell.citiy = city
            cell.accessoryType = cityViewModel.isFavourite(city: city) ? .checkmark : .none
        } else {
            let city = cityViewModel.sortedCities[indexPath.row]
            cell.citiy = city
            cell.accessoryType = cityViewModel.isFavourite(city: city) ? .checkmark : .none
            //cell.backgroundColor = cityViewModel.isFavourite(city: city) ? .blue : .clear
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let city = cityViewModel.sortedCities[indexPath.row]
        let selectedCity = city.name
        self.weatherViewModel.fetchWeatherData(for: city)
        self.openDetail(selectedCity: selectedCity, city: city)
        
    }
}

extension CitiyListTableViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        cityViewModel.retrieveSearchNames(searchText: searchText)
        isSearching = true
        tableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        isSearching = false
        searchBar.text = ""
    }
}

extension CitiyListTableViewController: DetailViewControllerDelegate {
    func didToggleFavourite(city: City) {
        cityViewModel.toggleFavourite(city: city)
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
}
