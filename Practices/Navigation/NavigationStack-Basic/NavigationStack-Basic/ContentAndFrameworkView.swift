//
//  ContentAndFrameworkView.swift
//  NavigationStack-Basic
//
//  Created by Luiz Araujo on 27/02/23.
//

import SwiftUI

struct ContentAndFrameworkView: View {
    @State private var contentCreator = ContentCreator.preview
    @State private var frameworks = Framework.allCases
    @State private var creatorStack   = NavigationPath()

    var body: some View {
            VStack {
                List {
                    Section("Names") {
                        ForEach(contentCreator) { creator in
                            NavigationLink(creator.name, value: creator)
                        }
                    }
                    Section("Frameworks") {

                        ForEach(frameworks, id: \.self) { frame in
                            NavigationLink(frame.rawValue, value: frame)
                        }
                    }
                }
                .navigationDestination(for: ContentCreator.self) { creator in
                    VStack {
                        Text(creator.name)

                        Button("Pop to root") {
                            creatorStack = NavigationPath()
                        }
                    }
                }
                .navigationDestination(for: Framework.self) { frame in
                    VStack {
                        Text(frame.rawValue)

                        Button("Pop to root") {
                            creatorStack = NavigationPath()
                        }
                    }
                }
            }
    }
}

struct ContentAndFrameworkView_Previews: PreviewProvider {
    static var previews: some View {
        ContentAndFrameworkView()
    }
}
