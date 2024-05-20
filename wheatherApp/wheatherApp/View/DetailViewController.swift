//
//  DetailViewController.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 16/05/24.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var citiyNmae: UILabel!
    @IBOutlet weak var Temeperature: UILabel!
    @IBOutlet weak var Humidity: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var weatherDetailViewModel: WeatherDetailViewModel
    init(weatherDetailViewModel: WeatherDetailViewModel) {
        self.weatherDetailViewModel = weatherDetailViewModel
        super.init(nibName: "DetailViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
         super.viewDidLoad()
        navigationController?.navigationBar.prefersLargeTitles = true
        updateUI()
    }
    
    private func updateUI() {
        self.title = "WeatherData"
        citiyNmae.text = weatherDetailViewModel.countryName
        Temeperature.text = "Temperature:\(weatherDetailViewModel.temperature)"
        Humidity.text = "humidity: \(weatherDetailViewModel.humidity)"
       // button.isSelected =
    }
}
