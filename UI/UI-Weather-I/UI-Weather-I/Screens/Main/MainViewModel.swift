//
//  MainViewModel.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 12/01/23.
//

import SwiftUI

@MainActor
final class MainViewModel: ObservableObject {
    
    @Published private(set) var weather: Weather!
    
    @Published var message: Message?
    @Published var showMessage: Bool = false
    
    init() {
        fetch()
    }
    
    func fetch() {
        Task {
            do {
                let service = APIService()
                
                weather = try await service.loadData()
                
            } catch {
                presentMessage(error as! ErrorType)
            }
        }
    }
}

// MARK: - Message
extension MainViewModel {
    
    func presentMessage(_ error: ErrorType) {
        message     = Message(error: error)
        showMessage = true
    }
    
    func dismissMessage() {
        message     = nil
        showMessage = false
    }
}

// MARK: - Dates
extension MainViewModel {
    
    func getDayOfWeek() -> String {
        
        let dateEpoch: Date = getDateFromDatetimeEpoch(weather?.days[0].datetimeEpoch ?? 1673487952.0)
        
        let f = DateFormatter()
        
        return f.weekdaySymbols[dateEpoch.get(.weekday) - 1]
    }
    
    func getMonth() -> String {
        
        let dateEpoch: Date = getDateFromDatetimeEpoch(weather?.days[0].datetimeEpoch ?? 1673487952.0)
        
        let f = DateFormatter()

        return f.monthSymbols[dateEpoch.get(.month) - 1]
    }
    
    func getYear() -> String {
        
        let dateEpoch: Date = getDateFromDatetimeEpoch(weather?.days[0].datetimeEpoch ?? 1673487952.0)

        return "\(dateEpoch.get(.year))"
    }
    
    func getDateFromDatetimeEpoch(_ epoch: Double) -> Date {
        NSDate(timeIntervalSince1970: TimeInterval(epoch)) as Date
    }
}
