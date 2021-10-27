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
    @State var isLoading = true
    
    var coordinate: CLLocationCoordinate2D? {
        return locationViewModel.lastSeenLocation?.coordinate
    }

    var body: some View {
        LoadingView(isShowing: self.$isLoading) {
            VStack{
                GeometryReader { geometry in
                    if self.forecast.list != nil {
                        List(0..<self.forecast.list!.count) { i in
                            ForecastRawView(temp: self.forecast.list![i].main!.temp!, iconPath: self.forecast.list![i].weather![0].icon!, description: self.forecast.list![i].weather![0].description!, geometry: geometry, txtDate: self.forecast.list![i].dt_txt!)
                        }
                    }
                }
            }
        }
        .onAppear {
            self.networkManager.lon = self.locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0.0
            self.networkManager.lat = self.locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0.0
            
            self.networkManager.getData { (dataFromAPI) in
                self.forecast = dataFromAPI
                self.isLoading = false
            }
        }
    }
}
