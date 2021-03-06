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
                
                TodayWeatherView(geometry: geometry).environmentObject(locationViewModel)
                    .tabItem {
                        Image(systemName: "sun.min")
                        Text("Today")
                    }
                
                ForecastView().environmentObject(locationViewModel)
                    .tabItem {
                        Image(systemName: "calendar.circle.fill")
                        Text("Forecast")
                    }
            }
        }
    }
}
