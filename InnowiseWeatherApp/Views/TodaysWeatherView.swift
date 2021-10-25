//
//  HeaderView.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 25.10.2021.
//

import SwiftUI
import CoreLocation

struct TodaysWeatherView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    @State var forecast: Forecast = Forecast()
    @State var geometry: GeometryProxy
    @State var networkManager: NetworkManager = NetworkManager(lat: 0.0, lon: 0.0)
    
    var coordinate: CLLocationCoordinate2D? {
        return locationViewModel.lastSeenLocation?.coordinate
    }
    
    func prepareCoordinates() {
        
        self.networkManager.lon = self.locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0.0
        self.networkManager.lat = self.locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0.0
    }

    
    var body: some View {
        VStack {
            
            HStack {
                //locationViewModel.currentPlacemark?.country
                Text(locationViewModel.currentPlacemark?.country ?? "No Data" + ", ")
                    .font(.largeTitle)
                    .frame(width: 100)
                Text(locationViewModel.currentPlacemark?.administrativeArea ?? "No Data")
                    .font(.largeTitle)
                    .frame(width: 100)
            }

            HStack {
                Text("\(Int(self.forecast.current?.temp ?? 0))°C, ")
                Text("\(self.forecast.current?.weather?[0].description ?? String(0))")
            }
        }
        .onAppear {
            
            prepareCoordinates()
            
            self.networkManager.getData { (dataFromAPI) in
                self.forecast = dataFromAPI
            }
            
            print(self.forecast.current?.temp ?? 0.0)
        }
    }
}
