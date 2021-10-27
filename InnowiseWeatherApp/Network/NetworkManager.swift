//
//  NetworkManager.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 21.10.2021.
//

import Foundation


class NetworkManager {
    
    var lon: Double
    var lat: Double
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
    func getData(completion: @escaping (Forecast) -> ()) {
        
        let apiKey = "b7b8b2556896d0d525671ee829caa4bb"
        
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/forecast?lat=\(self.lat)&lon=\(self.lon)&exclude=minutely,alerts,daily&appid=\(apiKey)&units=metric") else { return }
        //https://api.openweathermap.org/data/2.5/forecast?lat=1.1&lon=1.1&exclude=minutely,alerts,daily&appid=b7b8b2556896d0d525671ee829caa4bb&units=metric
        URLSession.shared.dataTask(with: url) { (data, _, _) in
            guard let data = data else { return }
            let resoult = try! JSONDecoder().decode(Forecast.self, from: data)
            
            DispatchQueue.main.async {
                completion(resoult)
            }
        }
        .resume()
    }
}
