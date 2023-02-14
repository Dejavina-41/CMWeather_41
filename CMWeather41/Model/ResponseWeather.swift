//
//  ResponseWeather.swift
//  CMWeather41
//
//  Created by cmStudent on 2023/02/13.
//

import Foundation

struct ResponseWeather: Decodable {
    let hourly: [hourly]
    let current: current
}

struct hourly: Decodable {
    var pop: Double
    var weather: [Weather]
}

struct current: Decodable {
    var temp: Double
    var pressure: Double
    var humidity: Double
    var wind_speed: Double
    var weather: [Weather]
}

struct Weather: Decodable {
    var main: String
}


