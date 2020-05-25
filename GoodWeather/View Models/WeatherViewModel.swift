//
//  WeatherViewModel.swift
//  GoodWeather
//
//  Created by Brad Booysen on 25/05/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import Foundation
import Combine // needed to publish updates

class WeatherViewModel: ObservableObject {
    
    private var weatherService: WeatherServices!
    
    @Published var weather = Weather() //@Published will notify subscribers when this property is changed
    
    init() {
        self.weatherService = WeatherServices()
    }
    
    var temperature: String {
        if let temp = self.weather.temp {
            return String(format: "%.0f", temp)
        } else {
            return ""
        }
    }
    
    var humidity: String {
        if let humidity = self.weather.humidity {
            return String(format: "%.0f", humidity)
        } else {
            return ""
        }
    }
    
    var cityName: String = ""
    
    //creates a search function that others can call
    func search() {
        if let city = self.cityName.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) { //needed to remove spave between city names
            fetchWeather(by: city)
        }
    }
    
    private func fetchWeather(by city: String) {
        
        self.weatherService.getWeather(city: city) { weather in
           
            if let weather = weather {
                
                DispatchQueue.main.async {
                    
                    // Always set on the main thread if updating UI
                    self.weather = weather
                }
            }
        }
    }
}
