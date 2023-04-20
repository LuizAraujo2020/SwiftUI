//
//  TextFactory.swift
//  UI-2
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct TextFactory: View {
    var body: some View {
        VStack {
            ReusableText(type: .mainTitle,
                              text: "Paralelepipedo",
                              color: .mainRainning)
            ReusableText(type: .secondaryTitle,
                              text: "Paralelepipedo",
                              color: .secondaryText)
//            ReusableText(type: .tertiaryTitle,
//                              text: "Paralelepipedo",
//                              color: .secondaryText)
            ReusableText(type: .body,
                              text: "Paralelepipedo",
                              color: .secondaryText)
        }
    }
}

struct TextFactory_Previews: PreviewProvider {
    static var previews: some View {
        TextFactory()
    }
}

struct ReusableText: View {
    
    enum ComponentTextType: CaseIterable {
        case mainTitle, secondaryTitle/*, tertiaryTitle*/, body
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    let accessibilityLabel: LocalizedStringKey
    let color: Color
    let text: LocalizedStringKey
    let type: ComponentTextType
    let fontName: String
    let alignment: TextAlignment
    let lineLimit: Int
    
    /// Creates the Text Component.
    /// - Parameters:
    ///   - type: which type of Text, based on the Design System
    ///   - text: the text to be displayed.
    ///   - accessibilityLabel: label to be used in the accessibility framework
    init(type: ComponentTextType, text: LocalizedStringKey, accessibilityLabel: LocalizedStringKey? = nil, color: Color? = nil, alignment: TextAlignment = .leading, fontName: String = "", lineLimit: Int = 1) {
        self.type      = type
        self.text      = text
        self.fontName  = fontName
        self.alignment = alignment
        self.lineLimit = lineLimit
        
        if let accessibilityLabel {
            self.accessibilityLabel = accessibilityLabel
            
        } else {
            self.accessibilityLabel = text
        }
        
        if let color {
            self.color = color
            
        } else {
            self.color = Color.mainRainning
        }
    }
    
    public var body: some View {
        Group {
            switch type {
            case .mainTitle:
                createMainTitleView()
            case .secondaryTitle:
                createSecondaryTitleView()
//            case .tertiaryTitle:
//                createTertiaryTitleView()
            case .body:
                createBodyView()
            }
        }
        .multilineTextAlignment(alignment)
        .lineLimit(lineLimit)
        .accessibilityLabel(accessibilityLabel)
    }
    
    @ViewBuilder
    func createMainTitleView() -> some View {
        Text(text)
            .font(.system(size: .textMain, weight: .heavy))
            .foregroundColor(self.color)
    }
    
    @ViewBuilder
    func createSecondaryTitleView() -> some View {
        Text(text)
            .font(.system(.largeTitle, weight: .bold))
            .foregroundColor(color)
        
    }
    
//    @ViewBuilder
//    func createTertiaryTitleView() -> some View {
//        Text(text)
//            .font(.system(.title, weight: .bold))
//            .foregroundColor(self.color)
//    }
    
    @ViewBuilder
    func createBodyView() -> some View {
        Text(text)
            .font(.title2)
            .foregroundColor(self.color)
    }
}

