//
//  MainTextfieldStyle.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 09/01/23.
//

import SwiftUI

struct MainTextfieldStyle: TextFieldStyle {
    func _body(configuration: TextField<Self._Label>) -> some View {
        configuration
            .padding(20)
            .background(Color.textfieldBackground)
            .clipShape(Capsule())
    }
}
