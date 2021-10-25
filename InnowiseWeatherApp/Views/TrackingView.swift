//
//  SwiftUIView.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 21.10.2021.
//

import SwiftUI
import CoreLocation


struct TrackingView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel

    var body: some View {
        GeometryReader { geometry in
            TabView {
                TodaysWeatherView(geometry: geometry).environmentObject(locationViewModel)
                    .tabItem {
                        Image(systemName: "sun.min")
                        Text("Today")
                    }
                
                ForecastView()
                    .tabItem {
                        Image(systemName: "calendar.circle.fill")
                        Text("Forecast")
                    }
            }
        }
    }
}




//import SwiftUI
//import CoreLocation
//
//
//struct TrackingView: View {
//
//    @EnvironmentObject var locationViewModel: LocationViewModel
//    @State var forecast: Forecast = Forecast()
//    @State var networkManager: NetworkManager = NetworkManager(lat: 0.0, lon: 0.0)
//
//    var coordinate: CLLocationCoordinate2D? {
//        return locationViewModel.lastSeenLocation?.coordinate
//    }
//
//    func prepareCoordinates() {
//
//        self.networkManager.lon = self.locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0.0
//        self.networkManager.lat = self.locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0.0
//    }
//
//    var body: some View {
//        GeometryReader { geometry in
//            TabView {
//                TodaysWeatherView(geometry: geometry).environmentObject(locationViewModel)
//                    .tabItem {
//                        Image(systemName: "sun.min")
//                        Text("Today")
//                    }
//
//                ForecastView(forecast: self.forecast)
//                    .tabItem {
//                        Image(systemName: "calendar.circle.fill")
//                        Text("Forecast")
//                    }
//            }
//        }
//        .onAppear {
//            prepareCoordinates()
//
//            self.networkManager.getData { (dataFromAPI) in
//                self.forecast = dataFromAPI
//            }
//        }
//    }
//}
