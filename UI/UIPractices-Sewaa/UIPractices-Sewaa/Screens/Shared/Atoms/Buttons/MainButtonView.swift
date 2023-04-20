//
//  MainButtonView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 09/01/23.
//

import SwiftUI

struct MainButtonView: View {
    let isBig: Bool
    let isRed: Bool
    let title: String
    
    let action: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            Text(title)
        }
        .font(.title2.bold())
        .frame(width: isBig ? .btnWidthBig : .btnWidthSmall, height: .btnHeight)
        .background(isRed ? Color.accentColor : Color.textTertiary)
        .tint(isRed ? Color.textTertiary : Color.accentColor)
        .clipShape(Capsule())
    }
}

struct MainButtonCustomView: View {
    let isBig: Bool
    let isRed: Bool
    let label: AnyView
    
    let action: () -> Void
    
    var body: some View {
        Button {
            
        } label: {
            label
        }
        .font(.title2.bold())
        .frame(width: isBig ? .btnWidthBig : .btnWidthSmall, height: .btnHeight)
        .background(isRed ? Color.accentColor : Color.textTertiary)
        .tint(isRed ? Color.textTertiary : Color.accentColor)
        .clipShape(Capsule())
    }
}

struct MainButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MainButtonView(isBig: true, isRed: true, title: "Login", action: { })
    }
}
