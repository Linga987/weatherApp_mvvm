//
//  DetailViewController.swift
//  wheatherApp
//
//  Created by shanmuga srinivas on 16/05/24.
//

import UIKit

protocol DetailViewControllerDelegate: AnyObject {
    func didToggleFavourite(city: City)
}

class DetailViewController: UIViewController {

    @IBOutlet weak var citiyName: UILabel!
    @IBOutlet weak var Temeperature: UILabel!
    @IBOutlet weak var Humidity: UILabel!
    @IBOutlet weak var button: UIButton!
    
    var weatherDetailViewModel: WeatherDetailViewModel
    weak var delegate: DetailViewControllerDelegate?
    
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
        citiyName.text = weatherDetailViewModel.countryName
        citiyName.layer.cornerRadius = 20
        Temeperature.layer.cornerRadius = 20
        Humidity.layer.cornerRadius = 20
        button.layer.cornerRadius = 10
        Temeperature.text = "Temperature:\(weatherDetailViewModel.temperature)"
        Humidity.text = "humidity: \(weatherDetailViewModel.humidity)"
    }
    
    
    @IBAction func favouriteButton(_ sender: Any) {
        weatherDetailViewModel.toggleFavourite()
        button.setTitle(weatherDetailViewModel.isFavourite ? "Unfavourite": "favourite", for: .normal)
        delegate?.didToggleFavourite(city: weatherDetailViewModel.city)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.4) {
            self.navigationController?.popViewController(animated: true)
            self.dismiss(animated: true, completion: nil)
        }
    }
}
