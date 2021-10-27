//
//  WeatherModel.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 21.10.2021.
//

import Foundation

struct Forecast: Codable {
    var list: [threeHourWeatherForecast]?
    
    struct threeHourWeatherForecast: Codable, Identifiable {
        let id = UUID()
        var dt: Date?
        var main: Main?
        var weather: [Weather]?
        var wind: Wind?
        var dt_txt: String?
        
        struct Main: Codable, Identifiable {
            let id = UUID()
            var temp: Double?
            var pressure: Int?
            var humidity: Int?
        }
        
        struct Weather: Codable, Identifiable {
            let id = UUID()
            var main: String?
            var description: String?
            var icon: String?
        }
        
        struct Wind: Codable {
            var speed: Double?
            var deg: Int?
        }
    }
}
