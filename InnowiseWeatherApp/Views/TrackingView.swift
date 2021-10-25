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
    @State var forecast: Forecast?
    @State var networkManager: NetworkManager = NetworkManager(lat: 0.0, lon: 0.0)

    var coordinate: CLLocationCoordinate2D? {
        return locationViewModel.lastSeenLocation?.coordinate
    }
    
    func loadCoordinates() {
        
        self.forecast = Forecast()
        self.networkManager.lon = self.locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0.0
        self.networkManager.lat = self.locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0.0
    }

    var body: some View {
        GeometryReader { geometry in
            
            VStack {
                
                HStack {
                    
                    Text("Country:")
                    Text(locationViewModel.currentPlacemark?.country ?? "")
                        .font(.largeTitle)
                        .frame(width: geometr, height: geometry, alignment: .center)
                }
                
                HStack {
                    Text("Longitude:")
                    Text(String(coordinate?.longitude ?? 0))
                }

                HStack {
                    Text("\(Int(self.forecast?.current?.temp ?? 0))")
                    Text("\(self.forecast?.current?.weather?[0].description ?? String(0))")
                    Text("\(self.forecast?.hourly?.count ?? 0)")
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

//
//HStack {
//    Text("Latitude:")
//    Text(String(coordinate?.latitude ?? 0))
//}
//
//HStack {
//    Text("Longitude:")
//    Text(String(coordinate?.longitude ?? 0))
//}
//
//HStack {
//    Text("Altitude:")//
//    Text(String(locationViewModel.lastSeenLocation?.altitude ?? 0))
//}
//
//HStack {
//    Text("Speed:")//
//    Text(String(locationViewModel.lastSeenLocation?.speed ?? 0))
//}





//
//struct TrackingView: View {
//    @EnvironmentObject var locationViewModel: LocationViewModel
//    @State var forecast: Forecast = Forecast()
//
//    var coordinate: CLLocationCoordinate2D? {
//        locationViewModel.lastSeenLocation?.coordinate
//    }
//
//    var body: some View {
//        VStack {
//            HStack {
//                Text("Country:")
//                Text(locationViewModel.currentPlacemark?.country ?? "")
//            }
//
//            HStack {
//                Text("City:")
//                Text(locationViewModel.currentPlacemark?.administrativeArea ?? "")
//            }
//
//            HStack {
//                Text("\(self.forecast.current?.temp ?? 0)")
//                Text("\(self.forecast.current?.wind_speed ?? 0)")
//                Text(String(coordinate?.longitude ?? 0))
//            }
//        }
//        .onAppear {
//
//            let networkManager: NetworkManager = NetworkManager(lat: coordinate?.latitude ?? 0.0, lon: coordinate?.longitude ?? 0.0)
//
//            networkManager.getData { (dataFromAPI) in
//                self.forecast = dataFromAPI
//            }
//        }
//    }
//}


//var coordinate: CLLocationCoordinate2D? {
//    locationViewModel.lastSeenLocation?.coordinate
//}



//var coordinate: CLLocationCoordinate2D? {
//    get {
//        locationViewModel.lastSeenLocation?.coordinate
//    }
//
//    set {
//        self.newValueForComputetProperty = newValue
//    }
