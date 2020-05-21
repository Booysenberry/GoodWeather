//
//  File.swift
//  GoodWeather
//
//  Created by Brad Booysen on 22/05/20.
//  Copyright © 2020 Booysenberry. All rights reserved.
//

import Foundation

struct WeatherResponse: Decodable {
    let main: Weather
}

struct Weather: Decodable {
    var temp: Double?
    var humidity: Double?
}
