//
//  ContentView.swift
//  GeometryReaderInception
//
//  Created by Luiz Araujo on 07/03/23.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.sizeCategory) var sizeCategory
    @State var width: CGFloat = 0

    var buttons: some View {
        Group {
            Button("Action 1") {}
            Button("Action 2") {}
        }
    }

    var body: some View {
        VStack {
            Text(width, format: .number)
                .font(.largeTitle)

            Spacer()

            Group {
                buttons
            }
            .embedInStack()


            Text("Paralelepípedo Duplo")
                .embedInScrollView()

            Spacer()
        }
        .measureSize { size in
            width = size.width
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
