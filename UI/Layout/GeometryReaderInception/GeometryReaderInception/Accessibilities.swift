//
//  Accessibilities.swift
//  GeometryReaderInception
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct EmbedInStack: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory
    var minimumSizeCategory = ContentSizeCategory.accessibilityLarge

    func body(content: Content) -> some View {
        Group {
            if sizeCategory > minimumSizeCategory {
                VStack { content }
            } else {
                HStack { content }
            }
        }
    }
}

extension Group where Content: View {
    func embedInStack(minimumSizeCategory: ContentSizeCategory = .accessibilityLarge) -> some View {
        modifier(EmbedInStack(minimumSizeCategory: minimumSizeCategory))
    }
}

struct EmbedInScrollView: ViewModifier {
    @Environment(\.sizeCategory) var sizeCategory

    var alignment: Alignment = .center
    var maxHeight: CGFloat
    var minimumSizeCategory: ContentSizeCategory

    func body(content: Content) -> some View {

        if sizeCategory > minimumSizeCategory {
            ScrollView(.horizontal) {
                content
                    .frame(
                        maxHeight: maxHeight,
                        alignment: alignment
                    )
            }
        } else {
            content
        }
    }
}

extension View {
    func embedInScrollView(minimumSizeCategory: ContentSizeCategory = .accessibilityLarge, maxHeight: CGFloat = 40.0) -> some View {
        modifier(EmbedInScrollView(maxHeight: maxHeight, minimumSizeCategory: minimumSizeCategory))
    }
}
