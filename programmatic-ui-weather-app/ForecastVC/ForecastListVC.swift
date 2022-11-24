//
//  ForecastVC.swift
//  weatherkit-weather-app
//
//  Created by RuslanS on 11/19/22.
//

import UIKit

class ForecastListVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var forecastTableView = UITableView()
    var forecasts: [Forecasts] = []

    override func viewDidLoad() {
        super.viewDidLoad()

        forecastTableView.backgroundColor = .clear
        makeForecasts()
        configureTableView()
        setGradientBackground()
        forecastTableView.reloadData()
    }
    
    func makeForecasts(){
        forecasts = makeForecastCells()
    }
    
    func configureTableView() {
        view.addSubview(forecastTableView)
        
        setTableViewDelegates()
        //cell row height
        forecastTableView.rowHeight = 100
        //register cells
        forecastTableView.register(ForecastsCell.self, forCellReuseIdentifier: "forecastsCell")
        //set constraints
        forecastTableView.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            forecastTableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),        //top constraint set to top safe margin
            forecastTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            forecastTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            forecastTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
        ])
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return forecasts.count
    }

    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = forecastTableView.dequeueReusableCell(withIdentifier: "forecastsCell") as! ForecastsCell       //Casts as SettingsCell because we want the funcs inside
        cell.backgroundColor = .clear
        
        let forecast = forecasts[indexPath.row]           //indexPath will have 3
        cell.set(forecasts: forecast)
        
        return cell
    }
    
    func setTableViewDelegates() {
        forecastTableView.delegate = self
        forecastTableView.dataSource = self
    }
    
    private func setGradientBackground() {
        let colorTop =  UIColor(red: 0/255.0, green: 235.0/255.0, blue: 255.0/255.0, alpha: 1.0).cgColor
        let colorBottom = UIColor(red: 100.0/255.0, green: 50.0/255.0, blue: 235.0/255.0, alpha: 1.0).cgColor
                    
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [colorTop, colorBottom]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.frame = self.view.bounds
                
        self.view.layer.insertSublayer(gradientLayer, at:0)
    }
}
