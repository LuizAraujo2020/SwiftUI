//
//  TimeRangeEnum.swift
//  ExchangeRates
//
//  Created by Luiz Araujo on 26/09/23.
//

import Foundation

enum TimeRangeEnum {

        case today, thisWeek, thisMonth, thisSemester, thisYear

    var date: Date {
        switch self {
            case .today: return Date(from: .day, value: 1)
            case .thisWeek: return Date(from: .day, value: 7)
            case .thisMonth: return Date(from: .month, value: 1)
            case .thisSemester: return Date(from: .month, value: 6)
            case .thisYear: return Date(from: .year, value: 1)
        }
    }
}
