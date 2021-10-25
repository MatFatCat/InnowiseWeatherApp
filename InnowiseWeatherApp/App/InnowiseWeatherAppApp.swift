//
//  InnowiseWeatherAppApp.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 21.10.2021.
//

import SwiftUI

@main
struct InnowiseWeatherAppApp: App {
    
    @StateObject var locationViewModel = LocationViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(locationViewModel)
        }
    }
}
