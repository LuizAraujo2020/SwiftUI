//
//  MainView.swift
//  EstatisticaDescritiva
//
//  Created by Luiz Araujo on 22/08/23.
//

import SwiftUI
import Charts

struct MainView: View {
    @EnvironmentObject var vm: MainViewModel

    private let highlightDefault = Color.accentColor
    private let colorHighlight = Color.accentColor

    var body: some View {
        LineChartView(vm: vm)
            .frame(height: 200)
            .frame(width: 300)
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(MainViewModel())
//            .previewInterfaceOrientation(.landscapeLeft)
    }
}
