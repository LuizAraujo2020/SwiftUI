//
//  ContentView.swift
//  UIBottomSheet
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var show = false

    var body: some View {
        ZStack {
            HomeView()
                .onTapGesture(count: 1) {
                    withAnimation {
                        show.toggle()
                    }
                }

            if show {
                Color.black.opacity(0.3).ignoresSafeArea()

                BottomSheet(show: $show)
                    .transition(.move(edge: .bottom))
                    .zIndex(1)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
