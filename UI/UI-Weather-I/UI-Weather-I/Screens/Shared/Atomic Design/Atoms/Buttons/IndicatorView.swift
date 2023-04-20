//
//  IndicatorView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct IndicatorView: View {
    let isRight: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            
        } label: {
            Image(systemName: isRight ? "chevron.right" : "chevron.left")
                .font(.title2.bold())
                .foregroundColor(.secondary)
        }
    }
}

struct IndicatorView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.mainRainning.ignoresSafeArea()
            
            VStack {
                IndicatorView(isRight: true) {}
                IndicatorView(isRight: false) {}
            }
        }
    }
}
