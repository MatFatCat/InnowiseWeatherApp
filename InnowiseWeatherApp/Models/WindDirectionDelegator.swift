//
//  WindDirectionDelegator.swift
//  InnowiseWeatherApp
//
//  Created by Matthew Popov on 27.10.2021.
//

import Foundation
import SwiftUI


class WindDirectionDelegator {
    
    enum WindDirection: String{
        case N = "N"
        case NE = "NE"
        case E = "E"
        case SE = "SE"
        case S = "S"
        case SW = "SW"
        case W = "W"
        case NW = "NW"
    }
    
    static func defineDirection(intWindDirection : Int) -> String? {
        
        if intWindDirection < 0 || intWindDirection > 360 { return nil }
        
        switch intWindDirection {
        case 0, 360:
            return WindDirection.N.rawValue
        case 0..<90:
            return WindDirection.NE.rawValue
        case 90:
            return WindDirection.E.rawValue
        case 90..<180:
            return WindDirection.SE.rawValue
        case 180:
            return WindDirection.S.rawValue
        case 180..<270:
            return WindDirection.SW.rawValue
        case 270:
            return WindDirection.W.rawValue
        case 270..<360:
            return WindDirection.NW.rawValue
        default:
            return WindDirection.N.rawValue
            
        }
    }
}
