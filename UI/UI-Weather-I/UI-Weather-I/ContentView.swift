//
//  ContentView.swift
//  UI-Weather-I
//
//  Created by Luiz Araujo on 11/01/23.
//

import SwiftUI

//struct ContentView: View {
//    @ObservedObject var viewModel: MainViewModel
//
//    var body: some View {
//        MainView(viewModel: viewModel)
//        .onAppear {
//            viewModel.fetch()
//        }
//    }
//}
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView(viewModel: MainViewModel())
//    }
//}


/*
 
 
 
 struct ContentView: View {
     let service = APIService()
     @State var weather: Weather?
     
     var body: some View {
         VStack {
             Image(systemName: "Weather")
                 .imageScale(.large)
                 .foregroundColor(.accentColor)
             Text(weather?.address ?? "🚨 Deu ruim")
             Text(weather?.description ?? "🚨 Deu ruim 2")
             Text(weather?.currentConditions.datetime ?? "🚨 Deu ruim 3")
             Text("\(weather?.currentConditions.temp ?? 0.1)")
             Text(weather?.currentConditions.conditions?.rawValue ?? "BOm")
         }
         .padding()
         .onAppear {
             
             Task {
                 do {
                     weather = try await service.loadData()
                 } catch {
                     //TODO: ☑️ FAZER DEPOIS
                 }
             }
             
         }
     }
 }
 
 */
