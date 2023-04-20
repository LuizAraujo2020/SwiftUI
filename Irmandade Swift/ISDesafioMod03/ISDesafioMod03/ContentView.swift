//
//  ContentView.swift
//  ISDesafioMod03
//
//  Created by Luiz Araujo on 03/03/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) var scenePhase
    @State var selection = TypeOfView.weather
    @State var regions = Region.mock

    var body: some View {
        VStack {
            // MARK: Picker
            /// Escolha da tela
            Picker("", selection: $selection) {
                ForEach(TypeOfView.allCases) { opt in
                    Text(opt.title).tag(opt)
                }
            }.id("\(#file)_\(#function)_Picker")
            .pickerStyle(.segmented)

            switch selection {
                case .stamp:
                    StampView()
                        .id("\(#file)_\(#function)_StampView")
                case .weather:
                    List(regions) { region in
                        Section(region.name) {
                            ForEach(region.states) { state in
//                                ForEach(state.cities) { city in
                                    Text("\(state.name), \(state.abbreviation)")
//                                }
                            }
                        }
                    }

            }
        }
        .padding()
        .onChange(of: scenePhase) { newValue in
            print("📲 \(newValue)")
        }
    }
}

enum TypeOfView: Identifiable, Hashable, CaseIterable {
    case stamp, weather

    var id: UUID { UUID() }

    var title: String {
        switch self {
            case .stamp: return "Stamp"
            case .weather: return "Weather"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
