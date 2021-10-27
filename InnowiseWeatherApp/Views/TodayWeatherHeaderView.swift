//
//  TodayWeatherHeaderView.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 27.10.2021.
//

import SwiftUI
import CoreLocation

struct TodayWeatherHeaderView: View {
    
    @EnvironmentObject var locationViewModel: LocationViewModel
    @State var forecast: Forecast
    @State var geometry: GeometryProxy
    
    var body: some View {
        Image(forecast.list![0].weather![0].icon ?? "01d")//forecast.list![0].weather![0].icon ??
            .resizable()
            .frame(width: self.geometry.size.width*0.2, height: self.geometry.size.height*0.1, alignment: .center)
        
        HStack {
            Text(locationViewModel.currentPlacemark?.country ?? "Belarus" + ", ")
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(.white)
            Text(locationViewModel.currentPlacemark?.administrativeArea ?? "Minsk")
                .font(.system(size: 50, weight: .bold))
                .foregroundColor(.white)
        }

        HStack {
            Text("\(Int(self.forecast.list![0].main?.temp ?? 0))°C, ")//Int(self.forecast.list![0].main?.temp ??
                .font(.system(size: 15, weight: .light))
                .foregroundColor(.white)
            Text("\(self.forecast.list![0].weather![0].description ?? String(0))")//self.forecast.list![0].weather![0].description ??
                .font(.system(size: 15, weight: .light))
                .foregroundColor(.white)

        }
    }
}
