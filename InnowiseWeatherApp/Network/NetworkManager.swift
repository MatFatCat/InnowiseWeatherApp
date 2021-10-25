//
//  NetworkManager.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 21.10.2021.
//

import Foundation


class NetworkManager {
    
    var lon: Double = 0.0
    var lat: Double = 0.0
    
    init(lat: Double, lon: Double) {
        self.lat = lat
        self.lon = lon
    }
    
    func getData(completion: @escaping (Forecast) -> ()) {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/onecall?lat=\(self.lat)&lon=\(self.lon)&exclude=minutely,alerts,daily&appid=b7b8b2556896d0d525671ee829caa4bb&units=metric") else { return }
        
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