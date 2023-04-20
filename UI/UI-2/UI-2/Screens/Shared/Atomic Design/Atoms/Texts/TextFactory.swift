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
            ComponentTextView(type: .largeTitle, text: "Paralelepipedo")
            ComponentTextView(type: .title, text: "Paralelepipedo")
            ComponentTextView(type: .buttonLabel, text: "Paralelepipedo")
            ComponentTextView(type: .body, text: "Paralelepipedo")
        }
    }
}

struct TextFactory_Previews: PreviewProvider {
    static var previews: some View {
        TextFactory()
    }
}

struct ComponentTextView: View {
    
    enum ComponentTextType: CaseIterable {
        case largeTitle, buttonLabel, title, body
    }
    
    @Environment(\.colorScheme) var colorScheme
    
    let accessibilityLabel: LocalizedStringKey
    let color: Color
    let text: LocalizedStringKey
    let type: ComponentTextType
    let fontName: String
    let alignment: TextAlignment
    
    /// Creates the Text Component.
    /// - Parameters:
    ///   - type: which type of Text, based on the Design System
    ///   - text: the text to be displayed.
    ///   - accessibilityLabel: label to be used in the accessibility framework
    init(type: ComponentTextType, text: LocalizedStringKey, accessibilityLabel: LocalizedStringKey? = nil, color: Color? = nil, alignment: TextAlignment = .leading, fontName: String = "") {
        self.type      = type
        self.text      = text
        self.fontName  = fontName
        self.alignment = alignment
        
        if let accessibilityLabel {
            self.accessibilityLabel = accessibilityLabel
            
        } else {
            self.accessibilityLabel = text
        }
        
        if let color {
            self.color = color
            
        } else {
            self.color = Color.textPrimary
        }
    }
    
    public var body: some View {
        Group {
            switch type {
            case .largeTitle:
                createLargeTitleView()
            case .title:
                createTitleView()
            case .buttonLabel:
                createButtonLabelView()
            case .body:
                createBodyView()
            }
        }
        .multilineTextAlignment(alignment)
        .accessibilityLabel(accessibilityLabel)
    }
    
    @ViewBuilder
    func createLargeTitleView() -> some View {
        Text(text)
            .font(.system(.largeTitle, design: .rounded, weight: .black))
            .foregroundColor(self.color)
    }
    
    @ViewBuilder
    func createTitleView() -> some View {
        Text(text)
            .font(.system(.title, design: .rounded, weight: .bold))
            .foregroundColor(self.color)
    }
    
    @ViewBuilder
    func createButtonLabelView() -> some View {
        Text(text)
            .font(.system(.title2, design: .rounded, weight: .heavy))
            .foregroundColor(self.color)
    }
    
    @ViewBuilder
    func createBodyView() -> some View {
        Text(text)
            .font(.system(.body, design: .rounded, weight: .regular))
            .foregroundColor(self.color)
    }
}

