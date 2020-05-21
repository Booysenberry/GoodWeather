//
//  WeatherServices.swift
//  GoodWeather
//
//  Created by Brad Booysen on 22/05/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import Foundation

class WeatherServices {
    
    func getWeather(city: String, completion: @escaping (Weather?) -> ()) {
        
        guard let url = URL(string: "api.openweathermap.org/data/2.5/weather?q=\(city)&appid=5c1013a7da44573668f4d581562109dd&units=metric") else {
            completion(nil)
            return
        }
        
        let config = URLSessionConfiguration.default
        let session = URLSession(configuration: config)
        
        let task = session.dataTask(with: url) { data, response, error in
            
            // Check for errors
            guard error == nil else {
                print ("error: \(error!)")
                return
            }
            // Check that data has been returned
            guard let content = data else {
                print("No data")
                return
            }
            // Decode data
            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let currentWeatherData = try decoder.decode(WeatherResponse.self, from: content)
                
                    let weather = currentWeatherData.main
                    completion(weather)
 
            } catch let err {
                print("Err", err)
            }
        }
        // execute the HTTP request
        task.resume()
    }
    
}

