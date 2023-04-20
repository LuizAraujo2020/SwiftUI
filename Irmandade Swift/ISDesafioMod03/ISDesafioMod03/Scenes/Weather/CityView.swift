//
//  CityView.swift
//  ISDesafioMod03
//
//  Created by Luiz Araujo on 03/03/23.
//

import SwiftUI

struct CityView: View {
    // MARK: Declarations
    let city: City

    /// Constants
    private let cornerRadius      = CGFloat(12)
    private let fontSize          = 80.0
    private let weatherWeekHeight = CGFloat(175)

    var body: some View {

        VStack {
            // MARK: - Top
            /// City name
            Text("\(city.name), \(city.abbreviation)")
                .font(.largeTitle)
                .padding(.horizontal)
                .padding(.top)
                .shadow(radius: cornerRadius)
                .id("\(#file)Name")

            /// Temperature
            Text(city.lastDays.last?.getFormattedTemp() ?? "15.0º")
                .font(.custom("", size: fontSize, relativeTo: .largeTitle))
                .shadow(radius: cornerRadius)
                .id("\(#file)Temperature")

            Spacer()

            // MARK: - Middle
            /// Weather icon
            city.lastDays.last?.condition.getSymbol()
                .font(.custom("", size: fontSize * 2, relativeTo: .largeTitle))
                .symbolRenderingMode(.multicolor)
                .shadow(radius: cornerRadius)
                .id("\(#file)ConditionSymbol")

            Spacer()

            // MARK: - Bottom
            /// Weather during the week
            ZStack {
                RoundedRectangle(cornerRadius: cornerRadius)
                    .foregroundStyle(.ultraThinMaterial)

                /// Carrousel of the last days
                createLastDaysScroll()
                    .frame(height: weatherWeekHeight)
            }
            .frame(height: weatherWeekHeight)
            .padding(.horizontal)
            .padding(.bottom)
            .shadow(radius: cornerRadius)
        }
    }

    @ViewBuilder
    private func createLastDaysScroll() -> some View {
        ScrollView(.horizontal) {
            HStack {
                ForEach(city.lastDays) { day in
                    VStack {

                        Text(day.dayOfWeek)

                        day.condition.getSymbol()
                            .imageScale(.large)

                        Text(day.getFormattedTemp())
                    }
                    .frame(width: 75)

                    Divider()
                        .frame(height: weatherWeekHeight * 0.7)
                }
            }
        }
        .id("\(#file)WeatherWeek")
    }
}

struct CityView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            /// Background
            Color.blue.ignoresSafeArea()
            CityView(city: City.mock[0])
        }
    }
}
