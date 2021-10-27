//
//  TodayWeatherParametersView.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 27.10.2021.
//

import SwiftUI

struct TodayWeatherParametersView: View {
    
    @State var forecast: Forecast
    @State var geometry: GeometryProxy
    
    var body: some View {
    
        Path() { path in
            path.move(to: CGPoint(x: 0.2*geometry.size.width, y: 0.1*geometry.size.height))
            path.addLine(to: CGPoint(x: 0.8*geometry.size.width, y: 0.1*geometry.size.height))
        }
        .stroke(Color.gray, lineWidth: 1)
        
        
        VStack(spacing: self.geometry.size.width*0.1){
            
            HStack(spacing: self.geometry.size.width*0.1) {
                ParameterCellView(geometry: self.geometry, forecast: self.forecast, informaion: "\(String((self.forecast.list![0].main?.humidity!)!))%", iconPath: "cloud.heavyrain")
                
                ParameterCellView(geometry: self.geometry, forecast: self.forecast, informaion: "\(String(Double((self.forecast.list![0].main?.pressure)!/1000))) mm", iconPath: "drop")
                
                ParameterCellView(geometry: self.geometry, forecast: self.forecast, informaion: "\(String(Int((self.forecast.list![0].main?.pressure)!))) hPa", iconPath: "thermometer")
            }
            
            HStack(spacing: self.geometry.size.width*0.1) {
                
                ParameterCellView(geometry: self.geometry, forecast: self.forecast, informaion: "\(String(Int((self.forecast.list![0].wind?.speed)!*3.6))) km/h", iconPath: "wind")
                
                ParameterCellView(geometry: self.geometry, forecast: self.forecast, informaion: WindDirectionDelegator.defineDirection(intWindDirection: (self.forecast.list![0].wind?.deg)! )! , iconPath: "safari")
            }
        }
        
        Path() { path in
            path.move(to: CGPoint(x: 0.2*geometry.size.width, y: 0.001*geometry.size.height))
            path.addLine(to: CGPoint(x: 0.8*geometry.size.width, y: 0.001*geometry.size.height))
        }
        .stroke(Color.gray, lineWidth: 1)
    }
}
