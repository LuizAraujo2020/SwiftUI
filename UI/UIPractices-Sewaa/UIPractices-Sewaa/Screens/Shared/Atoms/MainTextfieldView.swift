//
//  MainTextfieldView.swift
//  UIPractices-Sewaa
//
//  Created by Luiz Araujo on 09/01/23.
//

import SwiftUI

struct MainTextfieldView: View {
    @Binding var input: String
    let isBig: Bool
    let title: String
    let placeholder: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title.uppercased())
            
            TextField(placeholder, text: $input)
                .textFieldStyle(MainTextfieldStyle())
                .frame(height: .btnHeight)
        }
    }
}

struct MainTextfieldView_Previews: PreviewProvider {
    static var previews: some View {
        MainTextfieldView(input: .constant(""), isBig: false, title: "FIRST NAME :", placeholder: "David")
    }
}
