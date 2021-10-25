//
//  HeaderView.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 25.10.2021.
//

import SwiftUI

struct HeaderView: View {
    
    @State var temperature: Int = 0
    @State var city: String = ""
    @State var country: String = ""
    @State var weatherDescription: String = ""
    @State var icon: String = ""
    @State var locationViewModel: LocationViewModel
    @State var forecast: Forecast
    @State var geometry: GeometryProxy
    
    var body: some View {
        VStack {
            VStack {
                Text("Country:")
                Text(locationViewModel.currentPlacemark?.country ?? "")
                    .font(.largeTitle)
                    .frame(width: 300, alignment: .center)
                

                HStack {
                    Text("\(Int(self.forecast.current?.temp ?? 0))")
                    Text("\(self.forecast.current?.weather?[0].description ?? String(0))")
                }
            }
        }
    }
}
