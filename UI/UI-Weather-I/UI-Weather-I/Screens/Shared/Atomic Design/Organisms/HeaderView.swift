//
//  HeaderView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 12/01/23.
//

import SwiftUI

struct HeaderView: View {
    @State private var isMain = true
    private let allCases = TypeOfHeader.allCases
    
    let data: HeaderData
    
    let widthOfContent = CGFloat(CGFloat.screenWidth)
    
    var body: some View {
        ZStack {
            ZStack {
                HeaderMainView(condition: data.condition, dateLocal: data.dateLocal)
                    .tag(TypeOfHeader.main)
                    .frame(width: widthOfContent)
                    .offset(x: isMain ? 0 : -widthOfContent)
                
                HeaderSecondaryView(address: data.address, description: data.description)
                    .tag(TypeOfHeader.secondary)
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
                        
                        if value.translation.width == 0 {   /// tap
                            isMain.toggle()
                        }
                    }))
            
        }
        .animation(.easeInOut, value: isMain)
    }
}

extension HeaderView {
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

extension HeaderView {
    
    enum TypeOfHeader: Int, CaseIterable, Identifiable {
        case main
        case secondary
        
        var id: UUID { UUID() }
    }
    
    struct HeaderData {
        
        let address: LocalizedStringKey
        let condition: LocalizedStringKey
        let dateLocal: LocalizedStringKey
        let description: LocalizedStringKey
        
        init(weather: Weather) {
            if !weather.days.isEmpty {
                self.dateLocal = LocalizedStringKey("\(weather.currentConditions.datetime) - \(weather.address)")
            } else {
                self.dateLocal = "06:00 PM - Bangalore"
            }
            self.condition = LocalizedStringKey(weather.currentConditions.conditions?.rawValue ?? "Clear")
            self.address = LocalizedStringKey(weather.address)
            self.description = LocalizedStringKey(weather.description)
        }
        
        init(condition: LocalizedStringKey, dateLocal: LocalizedStringKey, address: LocalizedStringKey, description: LocalizedStringKey) {
            self.condition = condition
            self.dateLocal = dateLocal
            self.address = address
            self.description = description
        }
        
        static let dummy = HeaderData(condition: "Raining",
                                      dateLocal: "04:24 PM - Bangalore",
                                      address: "Brasília",
                                      description: "Similar temperatures continuing with a chance of rain multiple days.")
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.red
            HeaderView(data: .dummy)
        }
    }
}
