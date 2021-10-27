//
//  ContentView.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 21.10.2021.
//

import SwiftUI
import CoreLocation

struct ContentView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @State var networkManager: NetworkManager = NetworkManager(lat: 0.0, lon: 0.0)
    
    var body: some View {
        switch locationViewModel.authorizationStatus {
        case .notDetermined:
            AnyView(RequestLocationView())
                .environmentObject(locationViewModel)
        case .restricted:
            ErrorView(errorText: "Location use is restricted.")
        case .denied:
            ErrorView(errorText: "The app does not have location permissions. Please enable them in settings.")
        case .authorizedAlways, .authorizedWhenInUse:
            TrackingView()
                .environmentObject(locationViewModel)
        default:
            Text("Unexpected status")
        }
    }
}
