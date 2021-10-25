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
    @State var forecast: Forecast = Forecast()
    @State var networkManager: NetworkManager = NetworkManager(lat: 0.0, lon: 0.0)

    var coordinate: CLLocationCoordinate2D? {
        return locationViewModel.lastSeenLocation?.coordinate
    }
    
    func loadCoordinates() {
        
        self.networkManager.lon = self.locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0.0
        self.networkManager.lat = self.locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0.0
    }

    var body: some View {
        GeometryReader { geometry in
            
            TabView {

                VStack {
                    Text(locationViewModel.currentPlacemark?.country ?? "" )
                        .font(.largeTitle)
                        .frame(width: 300, alignment: .center)
                    

                    HStack {
                        Text("\(Int(self.forecast.current?.temp ?? 0))")
                        Text("\(self.forecast.current?.weather?[0].description ?? String(0))")
                    }
                }
                
                Text("Today")
                    .tabItem {
                        Image(systemName: "sun.min")
                    }
                
                Text("Forecast")
                    .tabItem {
                        
                        Image(systemName: "calendar.circle.fill")
                    }
            }
        }
        .onAppear {
            loadCoordinates()
            
            self.networkManager.getData { (dataFromAPI) in
                self.forecast = dataFromAPI
            }
        }
    }
}
