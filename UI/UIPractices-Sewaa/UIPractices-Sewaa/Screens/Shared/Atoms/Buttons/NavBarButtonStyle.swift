//
//  NavBarButtonStyle.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct NavBarButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
    }
}

struct NavBarButtonView: View {
    
    let type: NavButtonType
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
            
        } label: {
            Image(systemName: type.systemName)
                .symbolVariant(.circle.fill)
                .foregroundColor(.white)
        }

    }
}

extension NavBarButtonView {
    enum NavButtonType {
        case plus, back, forward
        
        var systemName: String {
            switch self {
            case .plus:
                return "plus"
            case .back:
                return "chevron.left"
            case .forward:
                return "chevron.right"
            }
        }
    }
}

struct NavBarButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.blue.ignoresSafeArea()
            NavBarButtonView(type: .back, action: {})
                .font(.largeTitle)
        }
    }
    
}
