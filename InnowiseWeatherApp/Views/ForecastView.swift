//
//  ForecastView.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 25.10.2021.
//

import SwiftUI
import CoreLocation

struct ForecastView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    @State var forecast: Forecast = Forecast()
    @State var networkManager: NetworkManager = NetworkManager(lat: 0.0, lon: 0.0)
    
    var coordinate: CLLocationCoordinate2D? {
        return locationViewModel.lastSeenLocation?.coordinate
    }
    
    func prepareCoordinates() {
        self.networkManager.lon = self.locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0.0
        self.networkManager.lat = self.locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0.0
    }

    var body: some View {
        VStack{
            GeometryReader { geometry in
                if self.forecast.hourly != nil {
                    List(0..<self.forecast.hourly!.count) { i in
                        ForecastRawView(date: self.forecast.hourly![i].dt!, temp: self.forecast.hourly![i].temp!, iconPath: (self.forecast.hourly![i].weather?[0].icon)!, description: self.forecast.hourly![i].weather![0].description!, geometry: geometry)
                    }
                }
            }
        }
        .onAppear {
            prepareCoordinates()
            
            self.networkManager.getData { (dataFromAPI) in
                self.forecast = dataFromAPI
            }
        }
    }
}


//NavigationView {
//    List(0..<self.forecast.hourly!.count) { i in
//        if i%3 == 0 {
//            LazyVStack {
//                NavigationLink(destination: Text("Some View")) {
//                    ForecastRawView(date: self.forecast.hourly![i].dt!, temp: self.forecast.hourly![i].temp!, iconPath: (self.forecast.hourly![i].weather?[0].icon)!, description: self.forecast.hourly![i].weather![0].description!, geometry: geometry)
//                }
//            }
//        }
//    }
//}
