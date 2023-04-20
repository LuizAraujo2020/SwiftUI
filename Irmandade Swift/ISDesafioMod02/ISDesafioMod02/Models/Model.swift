//
//  Model.swift
//  ISDesafioMod02
//
//  Created by Luiz Araujo on 03/03/23.
//

import SwiftUI

enum TypeOfColumn: Identifiable, CaseIterable {
    case quadrado, circulo, ellipse, capsule, border

    var id: String { getShapeText() }

    @ViewBuilder
    func getShape(background: Color = .clear, size: CGFloat = 75) -> some View {
        ZStack {
            background.frame(width: size, height: size)

            switch self {
                case .quadrado:
                    Rectangle().frame(height: size)

                case .circulo:
                    Circle().frame(height: size)

                case .ellipse:
                    Ellipse().frame(width: size, height: size * 0.3)

                case .capsule:
                    Capsule(style: .continuous).frame(height: 35)

                case .border:
                    RoundedRectangle(cornerRadius: size * 0.15).frame(height: size)
            }
        }
    }

    func getShapeText() -> String {
        switch self {
            case .quadrado: return "Quadrado"
            case .circulo:  return "Círculo"
            case .ellipse:  return "Elipse"
            case .capsule:  return "Capsula"
            case .border:   return "Borda"
        }
    }

    func getColor() -> Color {
        switch self {
            case .quadrado: return .yellow
            case .circulo:  return .red
            case .ellipse:  return .green
            case .capsule:  return .primary
            case .border:   return .blue
        }
    }

    @ViewBuilder
    func getSymbol(background: Color = .clear, size: CGFloat = 75) -> some View {
        ZStack {
            background.frame(width: size, height: size)
            //            getColor().frame(width: size, height: size)

            VStack {
                Spacer()
                switch self {
                    case .quadrado:
                        Image(systemName: "cloud.sun.rain.fill")
                            .foregroundStyle(.gray, getColor())
                            .symbolRenderingMode(.palette)
                    case .circulo:
                        Image(systemName: "cloud.drizzle.fill")
                            .foregroundStyle(.gray, getColor())
                            .symbolRenderingMode(.palette)
                    case .ellipse:
                        Image(systemName: "cloud.rain.fill")
                            .foregroundStyle(.gray, getColor())
                            .symbolRenderingMode(.palette)
                    case .capsule:
                        Image(systemName: "cloud.heavyrain.fill")
                            .foregroundStyle(.gray, getColor())
                            .symbolRenderingMode(.palette)
                    case .border:
                        Image(systemName: "cloud.hail.fill")
                            .foregroundStyle(.gray, getColor())
                            .symbolRenderingMode(.palette)
                }
            }
        }.frame(width: size, height: size)
    }

    func getButtonText() -> String {
        switch self {
            case .quadrado: return "Nevando"
            case .circulo:  return "Pouco"
            case .ellipse:  return "Médio"
            case .capsule:  return "Forte"
            case .border:   return "Granizo"
        }
    }
}
