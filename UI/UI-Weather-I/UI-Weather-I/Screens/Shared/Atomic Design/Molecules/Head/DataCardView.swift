//
//  DataCardView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 12/01/23.
//

import SwiftUI

struct DataCardView: View {
    let title: LocalizedStringKey
    let text: LocalizedStringKey
    let symbol: String
    
    var body: some View {
            
            VStack {
                Image(systemName: symbol)
                    .font(.title)
                    .foregroundColor(.secondaryText)
                    .symbolVariant(.fill)
                
                ReusableText(type: .secondaryTitle, text: text)
                
                ReusableText(type: .body, text: title, color: .secondaryText)
            }
            .padding()
            .background(Material.ultraThin)
            .clipShape(RoundedRectangle(cornerRadius: .cornerRadius1))
            .frame(minWidth: .screenWidth * 0.2, minHeight: .screenWidth * 0.3)
//            .shadow(radius: .shadowRadius)
            .overlay(
                    RoundedRectangle(cornerRadius: 16)
                        .stroke(Color.accentColor, lineWidth: 4)
                )
        
    }
}

struct UpperSecondaryView: View {
    let data: DataCard

//    let gridItems = Array(repeating: GridItem(.flexible(minimum: .screenWidth * 0.2,
//                                                        maximum: .screenWidth * 0.3)), count: 3)
    let gridItems = Array(repeating: GridItem(.adaptive(minimum: .screenWidth * 0.2,
                                                        maximum: .screenWidth * 0.3)), count: 3)

    var body: some View {
        LazyVGrid(columns: gridItems) {
            DataCardView(title: "Temperature",
                         text: "\(data.temp, specifier: "%.1f")", symbol: "thermometer.medium")
            DataCardView(title: "Humidity",
                         text: "\(data.humidity, specifier: "%.1f")", symbol: "water.waves")
            DataCardView(title: "Sunrise",
                         text: "\(data.sunrise.formatted(date: .omitted, time: .shortened))", symbol: "sunrise.fill")


            DataCardView(title: "Feels like",
                         text: "\(data.feelslike, specifier: "%.1f")", symbol: "windshield.rear.and.heat.waves")
            DataCardView(title: "Solar Radiation",
                         text: "\(data.solarRadiation, specifier: "%.1f")", symbol: "sun.max.trianglebadge.exclamationmark.fill")
            DataCardView(title: "Sunset",
                         text: "\(data.sunset.formatted(date: .omitted, time: .shortened))", symbol: "sunset.fill")
        }
    }
}

struct DataCardView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.gray
            
            DataCardView(title: "Temperature", text: "90.0", symbol: "thermometer.medium")
        }
//        UpperSecondaryView(data: .init(weather: .empty))
    }
}
