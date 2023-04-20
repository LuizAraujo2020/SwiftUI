//
//  BestGeoReader.swift
//  GeometryReaderInception
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct MeasureSizeModifier: ViewModifier {
    let callback: (CGSize) -> Void

    func body(content: Content) -> some View {
        content
            .background(
                GeometryReader { proxy in
                    Color.clear
                        .onAppear {
                            callback(proxy.size)
                        }
                }
            )
    }
}

extension View {
    func measureSize(_ callback: @escaping (CGSize) -> Void ) -> some View {
        modifier(MeasureSizeModifier(callback: callback))
    }
}
