//
//  WeatherModel.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 21.10.2021.
//

import Foundation

struct Forecast: Codable {
    
    var current: Current?
    
    struct Current: Codable {
        var dt: Date?
        var temp: Double?
        var humidity: Int?
        var wind_speed: Double?
        var wind_deg: Int?
        var pressure: Int?
        
        struct Weather: Codable, Identifiable {
            let id = UUID()
            var main: String?
            var description: String?
            var icon: String?
        }
        
        var weather: [Weather]?
    }
    
    
    struct Hourly: Codable, Identifiable {
        let id = UUID()
        var dt: Date?
        var temp: Double?
        
        struct Weather: Codable, Identifiable {
            let id = UUID()
            var main: String?
            var description: String?
            var icon: String?
        }
        
        var weather: [Weather]?
    }
    
    var hourly: [Hourly]?
}
