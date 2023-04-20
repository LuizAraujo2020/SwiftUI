//
//  ContentView.swift
//  NavigationStack-Basic
//
//  Created by Luiz Araujo on 27/02/23.
//

import SwiftUI

struct ContentView: View {
    @State private var contentCreator = ContentCreator.preview
    @State private var creatorStack   = [ContentCreator]()

    var body: some View {
        NavigationStack(path: $creatorStack) {
            VStack {
                List(contentCreator) { creator in
                    NavigationLink(creator.name, value: creator)
                }
                .navigationDestination(for: ContentCreator.self) { creator in
                    VStack {
                        Text(creator.name)

                        Button("Pop to root") {
                            creatorStack = []
                        }
                    }
                    }

                Button("Navigate 3 times") {
                    creatorStack = [
                        contentCreator[0],
                        contentCreator[1],
                        contentCreator[2]
                    ]
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
