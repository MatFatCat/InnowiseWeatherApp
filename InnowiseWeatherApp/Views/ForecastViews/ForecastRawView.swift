//
//  ForecastDetailView.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 26.10.2021.
//

import SwiftUI
import CoreLocation

struct ForecastRawView: View {
    
    @State var temp: Double
    @State var iconPath: String
    @State var description: String
    @State var geometry: GeometryProxy
    @State var txtDate: String
    
    func dateToString(date: Date) -> String {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .short
        dateFormatter.timeStyle = .short
        return dateFormatter.string(from: date)
    }
    
    var body: some View {
        HStack {
            Image(self.iconPath)
                .resizable()
                .frame(width: geometry.size.width*0.2, height: geometry.size.width*0.2)
            
            VStack {
                Text(self.txtDate)
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.gray)
                Text(self.description)
                    .font(.system(size: 15, weight: .light))
                    .foregroundColor(.gray)
            }
            
            Spacer()
            
            Text(String(Int(self.temp)) + "°")//
                .font(.system(size: 30, weight: .bold))
                .foregroundColor(.blue)
        }
    }
}
