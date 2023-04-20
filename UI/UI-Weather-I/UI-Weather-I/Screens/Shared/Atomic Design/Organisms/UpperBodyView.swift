//
//  UpperBodyView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 12/01/23.
//

import SwiftUI

struct UpperBodyView: View {
    @State var isMain = true
    
    let dataCard: DataCard
    
    let widthOfContent = CGFloat(CGFloat.screenWidth)
    
    var body: some View {
        ZStack {
            ZStack {
                UpperMainView(temperature: dataCard.temp)
//                    .tag(TypeOfHeader.main)
                    .frame(width: widthOfContent)
                    .offset(x: isMain ? 0 : -widthOfContent)
                //            .background(.blue)
                
                UpperSecondaryView(data: dataCard)
//                    .tag(TypeOfHeader.secondary)
                    .frame(width: widthOfContent)
                    .offset(x: isMain ? widthOfContent : 0)
            }
            
            HStack {
                IndicatorView(isRight: false, action: swipeLeft)
                Spacer()
                IndicatorView(isRight: true, action: swipeRight)
            }
            .padding()
            .opacity(0.25)
            
            Rectangle()
                .shadow(radius: .shadowRadius)
                .opacity(0.001)
                .gesture(DragGesture(minimumDistance: 0, coordinateSpace: .local)
                    .onEnded({ value in
                        if value.translation.width < 0 {    /// left
                            swipeLeft()
                        }
                        
                        if value.translation.width > 0 {    /// right
                            swipeRight()
                        }
                        
                        if value.translation.width == 0 {    /// tap
                            isMain.toggle()
                        }
                    }))
        }
        .animation(.easeInOut, value: isMain)
    }
}

extension UpperBodyView {
    
    enum TypeOfHeader: Int, CaseIterable, Identifiable {
        case main
        case condition
        
        var id: UUID { UUID() }
        
    }
    
    private func swipeLeft() {
        if isMain {
            isMain = false
        }
    }
    
    private func swipeRight() {
        if !isMain {
            isMain = true
        }
    }
}






//extension UpperSecondaryView {
    struct DataCard {
        var temp: Double           //= 68.5
        var feelslike: Double      //= 68.5
        var humidity: Double       //= 86.5
        var solarRadiation: Double //= 86.5
        var sunrise: Date          //= 1673426993
        var sunset: Date           //= "18:49:15"
        
        internal init(temp: Double, feelslike: Double, humidity: Double, solarRadiation: Double,sunrise: Date, sunset: Date) {
            self.temp           = temp
            self.feelslike      = feelslike
            self.humidity       = humidity
            self.solarRadiation = solarRadiation
            self.sunrise        = sunrise
            self.sunset         = sunset
        }
        
        internal init(weather: Weather) {
            self.temp           = weather.currentConditions.temp
            self.feelslike      = weather.currentConditions.feelslike
            self.humidity       = weather.currentConditions.humidity
            self.solarRadiation = weather.currentConditions.solarradiation
            self.sunrise        = Date().getDateFromDatetimeEpoch(weather.currentConditions.sunriseEpoch ?? 0)
            self.sunset         = Date().getDateFromDatetimeEpoch(weather.currentConditions.sunsetEpoch ?? 0)
        }
    }
//}

struct HeadView_Previews: PreviewProvider {
    static var previews: some View {
        UpperBodyView(dataCard: DataCard.init(weather: .empty))
    }
}
