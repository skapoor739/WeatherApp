//
//  ViewController.swift
//  WeatherApp
//
//  Created by Shivam Kapur on 04/12/15.
//  Copyright © 2015 Shivam Kapur. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController {

    let weather = Weather(name: "")
    
    @IBOutlet var cityLbl: UILabel!
    @IBOutlet var countryLbl: UILabel!
    @IBOutlet var tempLbl: UILabel!
    @IBOutlet var messageLbl: UILabel!
    @IBOutlet var cityAndCountryLbl: UILabel!
    @IBOutlet var humidity: UILabel!
    @IBOutlet var dateLbl: UILabel!
    
    @IBOutlet var seaLevelLbl: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        weather.downloadComplete { () -> () in

            self.updateUI()
        }
    }
    @IBOutlet var timeLbl: UILabel!
    
    func updateUI() {
        cityLbl.text = weather.city
        countryLbl.text = weather.countryCode
        tempLbl.text = weather.temperature + "ºC"
        messageLbl.text = weather.weatherDescription
        cityAndCountryLbl.text = weather.city + " " +  weather.countryCode
        humidity.text = weather.humidity + "%"
        seaLevelLbl.text = "Sea Level: " + weather.seaLevel
        dateLbl.text = weather.day + " " + weather.date
        timeLbl.text = weather.time
        
    }
  
}

