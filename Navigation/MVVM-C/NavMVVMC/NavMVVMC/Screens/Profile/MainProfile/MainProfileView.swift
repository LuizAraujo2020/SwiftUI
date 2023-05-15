//
//  MainProfileView.swift
//  NavMVVMC
//
//  Created by Luiz Araujo on 14/05/23.
//

import SwiftUI
import Combine

struct MainProfileView: View {
    let didClickPersonal = PassthroughSubject<Bool, Never>()
    let didClickEducation = PassthroughSubject<Bool, Never>()
    
    var body: some View {
        List {
            Button(action: {
                didClickPersonal.send(true)
            }) {
                Text("Personal Details")
            }
            Button(action: {
                didClickEducation.send(true)
            }) {
                Text("Educational Details")
            }
        }
        .navigationBarTitle("Profile")
    }
}

struct MainProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MainProfileView()
    }
}
