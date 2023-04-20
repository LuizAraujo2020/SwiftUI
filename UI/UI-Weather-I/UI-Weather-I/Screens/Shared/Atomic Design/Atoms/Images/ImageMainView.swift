//
//  ImageMainView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct ImageMainView: View {
    let condition: WeatherConditions
    
    var body: some View {
        Image(systemName: "cloud.rain.circle.fill")
            .font(.system(size: .screenWidth * 0.746089))
            .foregroundColor(condition.color)
    }
}

struct ImageMainView_Previews: PreviewProvider {
    static var previews: some View {
        ImageMainView(condition: .rainning)
    }
}
