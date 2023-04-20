//
//  ContentView.swift
//  ISDesafioMod07
//
//  Created by Luiz Araujo on 04/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var names  = mock

    @State var sorted = SortType.none
    @State var filter = false

    var body: some View {
        VStack {
            List {
                ForEach(names.sorted(by: { a, b in
                    switch sorted {
                        case .less:    return a < b
                        case .greater: return a > b
                        case .none:    return true
                    }
                }).filter({ n in
                    if filter {
                        return n.count <= 12
                    } else {
                        return true
                    }
                }), id: \.self) { name in
                    Text(name)
                }
            }

            HStack {
                Spacer()

                Button {
                    sorted = sorted.next()
                } label: {
                    Label("Ordenar", systemImage: "shuffle")
                }

                Spacer()

                Button {
                    filter.toggle()
                } label: {
                    Label("Filtrar", systemImage: "slider.horizontal.3")
                }

                Spacer()
            }
        }
    }

    enum SortType: CaseIterable {
        case less, greater, none

        func next() -> SortType {
            switch self {
                case .less:    return .greater
                case .greater: return .none
                case .none:    return .less
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

let mock = ["Necrotério Pereira da Silva",
            "Pacífico Armando Guerra",
            "Otávio Bundasseca",
            "Ilegível Inilegível",
            "Inocêncio Coitadinho",
            "Bispo de Paris",
            "Remédio Amargo",
            "Napoleão Sem Medo e Sem Mácula",
            "Homem Bom da Cunha Souto Maior",
            "América do Sul Brasil de Santana",
            "Colápso Cardíaco da Silva",
            "Amado Amoroso",
            "Plácido e Seus Companheiros",
            "Disney Chaplin Milhomem da Silva",
            "Agrícola Beterraba Areia",
            "Aeronauta Barata",
            "Dezêncio Feverêncio de Oitenta e Cinco",
            "Amável Pinto",
            "Antonio Manso Pacífico de Oliveira Sossegado",
            "Alce Barbuda",
            "Marciano Verdinho das Antenas Longas",
            "Céu Azul do Sol Poente",
            "Renato Pordeus Furtado",
            "Maria-você-me-mata",
            "Barrigudinha Seleida",
            "Bandeirante do Brasil Paulistano",
            "Janeiro Fevereiro de Março Abril",
            "Padre Filho do Espírito Santo Amém",
            "Asteróide Silverio",
            "Maria Privada de Jesus",
            "Lança Perfume Rodometálico de Andrade",
            "Natal Carnaval",
            "Chevrolet da Silva Ford",
            "Bizarro Assada",
            "Amin Amou Amado",
            "Mimaré Índio Brazileiro de Campos",
            "Antônio Morrendo das Dores",
            "Oceâno Atlântico Linhares",
            "Esparadrapo Clemente de Sá",
            "Agrícola da Terra Fonseca",
            "Amazonas Rio do Brasil Pimpão",
            "Aricléia Café Chá",
            "Dolores Fuertes de Barriga"]
