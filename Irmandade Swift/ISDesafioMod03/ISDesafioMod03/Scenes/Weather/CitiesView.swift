//
//  CitiesView.swift
//  ISDesafioMod03
//
//  Created by Luiz Araujo on 03/03/23.
//

import SwiftUI

struct CitiesView: View {
    let state: CityState

    var body: some View {
        List(state.cities) { city in
            NavigationLink {
                CityView(city: city)
            } label: {
                Text(city.name)
            }
        }
        .navigationTitle(state.name)
    }
}

struct CitiesView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            CitiesView(state: CityState.mock[0])
        }
    }
}
