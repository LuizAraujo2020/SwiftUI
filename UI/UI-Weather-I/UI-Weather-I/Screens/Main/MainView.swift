//
//  MainView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

struct MainView: View {
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        ZStack {
            BackgroundView()
                .offset(y: .screenWidth * -0.36)
                .opacity(0.2)
                .shadow(radius: .shadowRadius1)
                
            VStack {
                HeaderView(data: .init(weather: viewModel.weather ?? .empty))
                
                UpperBodyView(dataCard: .init(weather: viewModel.weather ?? .empty))
                
                Spacer()
                
                LowerBodyView(dayOfWeek: LocalizedStringKey(viewModel.getDayOfWeek()),
                              day: LocalizedStringKey(viewModel.getDateFromDatetimeEpoch(viewModel.weather?.days[0].datetimeEpoch ?? 01).get(.day)))
                .padding(.horizontal)
                
                Spacer()
                
                Divider()
                
                FooterView(text: "\(viewModel.getMonth())/\(viewModel.getYear())")
            }
            
            if let error = viewModel.message, viewModel.showMessage {
                ReusableMessageView(message: error) {
                    viewModel.dismissMessage()
                }
            }
            
        }
        .animation(.easeInOut, value: viewModel.showMessage)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView(viewModel: MainViewModel())
    }
}

/*
 CEILANDIA CENTRO:
 -15.819171
 -48.100414
 e8dad36753d194d5100b20995ff8b5cf
 
 https://api.openweathermap.org/data/3.0/onecall?lat=39.31&lon=-74.5&appid=807fa9908ccde623f5f4a513268c01df
 
 http://api.openweathermap.org/data/3.0/onecall/timemachine?lat=39.099724&lon=-94.578331&dt=1643803200&appid=807fa9908ccde623f5f4a513268c01df
 */
