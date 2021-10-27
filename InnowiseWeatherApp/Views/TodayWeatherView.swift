//
//  HeaderView.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 25.10.2021.
//

import SwiftUI
import CoreLocation

struct TodayWeatherView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    @State var forecast: Forecast = Forecast()
    @State var geometry: GeometryProxy
    @State var networkManager: NetworkManager = NetworkManager(lat: 0.0, lon: 0.0)
    
    var coordinate: CLLocationCoordinate2D? {
        return locationViewModel.lastSeenLocation?.coordinate
    }

    
    var body: some View {
        VStack {
            VStack {
                if forecast.list != nil {
                    TodayWeatherHeaderView(forecast: self.forecast, geometry: self.geometry).environmentObject(locationViewModel)
                }
            }
            .background(LinearGradient(colors: [.blue, .white], startPoint: .bottom, endPoint: .top))
            .cornerRadius(10)
            
            Spacer()
        }
        .onAppear {
            
            self.networkManager.lon = self.locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0.0
            self.networkManager.lat = self.locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0.0
            
            self.networkManager.getData { (dataFromAPI) in
                self.forecast = dataFromAPI
            }
        }
    }
}

