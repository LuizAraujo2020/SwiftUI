//
//  ContentView.swift
//  ISDesafioMod02
//
//  Created by Luiz Araujo on 03/03/23.
//

import SwiftUI

struct ContentView: View {
    /// Constants
    let columnsContent: [TypeOfColumn]
    
    private let maxHeight     = CGFloat(75)
    private let spacingBottom = 50.0

    var body: some View {
        VStack(alignment: .leading) {
            Spacer()

            Text("Challenge Time:")
                .font(.largeTitle)
                .padding(.bottom, spacingBottom)

            HStack {
                ForEach(columnsContent) { column in
                    VStack {
                        column.getShape()
                            .padding(.bottom, spacingBottom)
                        
                        Text(column.getShapeText())
                            .font(.subheadline)
                            .lineLimit(2, reservesSpace: true)
                            .padding(.bottom, spacingBottom * 0.25)

                        column.getSymbol()
                            .font(.largeTitle)

                        VStack {
                            column.getSymbol()
                                .imageScale(.small)
                                .frame(maxHeight: 75)
                                .padding(.bottom, spacingBottom * 0.25)

                            ZStack {

                                Capsule(style: .continuous)
                                    .foregroundColor(.purple)

                                Text(column.getButtonText())
                                    .font(.subheadline)
                                    .foregroundColor(.white)
                            }
                            .frame(height: 25)
                        }
                    }
                    .foregroundColor(column.getColor())
                }
            }

            Spacer()
        }
        .padding()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(columnsContent: TypeOfColumn.allCases)
    }
}
