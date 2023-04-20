//
//  Date+Extension.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 13/01/23.
//

import Foundation

extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
    
    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> String {
        return String(calendar.component(component, from: self))
    }
    
    func getDateFromDatetimeEpoch(_ epoch: Int) -> Date {
        NSDate(timeIntervalSince1970: TimeInterval(epoch)) as Date
    }
    
    static func getDateFromDatetimeEpoch(_ epoch: Double) -> Date {
        NSDate(timeIntervalSince1970: TimeInterval(epoch)) as Date
    }
}
