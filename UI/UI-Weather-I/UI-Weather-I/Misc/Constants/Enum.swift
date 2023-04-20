//
//  Enum.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

enum WeatherConditions {
    case sunny, rainning
    
    var color: Color {
        switch self {
            case .sunny: return Color.mainSunny
            case .rainning: return Color.mainRainning
        }
    }
}
