//
//  ParameterCellView.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 27.10.2021.
//

import SwiftUI

struct ParameterCellView: View {
    
    @State var geometry: GeometryProxy
    @State var forecast: Forecast
    @State var informaion: String
    var iconPath: String
    
    var body: some View {
        VStack(spacing: self.geometry.size.height*0.03) {
            Image(systemName: self.iconPath)//cloud.heavyrain
                .resizable()
                .frame(width: self.geometry.size.width*0.05, height: self.geometry.size.width*0.05)
            Text(self.informaion)//String((self.forecast.list![0].main?.humidity!)!)
                .font(.system(size: 15, weight: .light))
                .foregroundColor(.gray)
        }
    }
}
