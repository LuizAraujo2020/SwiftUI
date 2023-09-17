//
//  MainViewModel.swift
//  EstatisticaDescritiva
//
//  Created by Luiz Araujo on 22/08/23.
//

import Foundation

class MainViewModel: ObservableObject {
    @Published var data = [Datum]()
    @Published var asdf = "TESTEE"

    init() {
        self.data = parseJSONFromFile()
    }

    init(data: [Datum] = [Datum]()) {
        self.data = data
    }

    func filteredArr() -> [Datum] {
        var result = [Datum]()

        for i in 0..<(data.count - 1){
            if data[i] != data[i+1] {
                result.append(data[i])
            }
        }

        return result
    }

    func maxNumber() -> Datum {
        var maxDB = data[0]

        for datum in data {
            if datum.dB > maxDB.dB {
                maxDB = datum
            }
        }

        return maxDB
    }

    func minNumber() -> Datum {
        var minDB = data[0]

        for datum in data {
            if datum.dB < minDB.dB {
                minDB = datum
            }
        }

        return minDB
    }

    func 
}

