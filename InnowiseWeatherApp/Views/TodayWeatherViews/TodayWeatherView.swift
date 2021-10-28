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
    
    func actionSheet() {
        if forecast.list == nil { return }
        
        let informationToShare = "\(String((self.forecast.list![0].main?.temp!)!))C° | \(String((self.forecast.list![0].main?.humidity!)!))% | \(String(Double((self.forecast.list![0].main?.pressure)!/1000)))mm | \(String(Int((self.forecast.list![0].main?.pressure)!)))hPa | \(String(Int((self.forecast.list![0].wind?.speed)!*3.6)))km/h | \(WindDirectionDelegator.defineDirection(intWindDirection: (self.forecast.list![0].wind?.deg)! )!)"
        
        let activityVC = UIActivityViewController(activityItems: [informationToShare], applicationActivities: nil)
        
        UIApplication.shared.windows.first?.rootViewController?.present(activityVC, animated: true, completion: nil)
    }
    
    var body: some View {
        
        VStack(spacing: self.geometry.size.width*0.1) {
            if self.forecast.list != nil {
                VStack {
                    TodayWeatherHeaderView(forecast: self.forecast, geometry: self.geometry).environmentObject(locationViewModel)
                }
                .frame(width: self.geometry.size.width*0.75, height: self.geometry.size.height*0.3)
                .background(LinearGradient(colors: [.blue, .white], startPoint: .bottom, endPoint: .top))
                .cornerRadius(10)
                
                Spacer()
                
                TodayWeatherParametersView(forecast: self.forecast, geometry: self.geometry)
                
                Spacer()
                
                Button(action: actionSheet) {
                    Text("Share The Weather")
                }
                .frame(width: self.geometry.size.width*0.7, height: self.geometry.size.height*0.05)
                .padding()
                .background(Color.blue)
                .clipShape(Capsule())
                .foregroundColor(.white)
                
                Spacer()
            }
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

