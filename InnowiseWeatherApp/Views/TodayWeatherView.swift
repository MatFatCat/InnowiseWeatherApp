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
    
    func prepareCoordinates() {
        
        self.networkManager.lon = self.locationViewModel.lastSeenLocation?.coordinate.longitude ?? 0.0
        self.networkManager.lat = self.locationViewModel.lastSeenLocation?.coordinate.latitude ?? 0.0
    }

    
    var body: some View {
        VStack {
            
            VStack {
                Image(self.forecast.current?.weather?[0].icon ?? "01d" )
                    .resizable()
                    .frame(width: geometry.size.width*0.3, height: geometry.size.height*0.25, alignment: .center)
                
                HStack {
                    Text(locationViewModel.currentPlacemark?.country ?? "No Data" + ", ")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.white)
                    Text(locationViewModel.currentPlacemark?.administrativeArea ?? "No Data")
                        .font(.system(size: 50, weight: .bold))
                        .foregroundColor(.white)
                }

                HStack {
                    Text("\(Int(self.forecast.current?.temp ?? 0))°C, ")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.white)
                    Text("\(self.forecast.current?.weather?[0].description ?? String(0))")
                        .font(.system(size: 15, weight: .light))
                        .foregroundColor(.white)

                }
            }
            .background(LinearGradient(colors: [.blue, .white], startPoint: .bottom, endPoint: .top))
            .cornerRadius(10)
            
            Spacer()
        }
        .onAppear {
            
            prepareCoordinates()
            
            self.networkManager.getData { (dataFromAPI) in
                self.forecast = dataFromAPI
            }
        }
    }
}
