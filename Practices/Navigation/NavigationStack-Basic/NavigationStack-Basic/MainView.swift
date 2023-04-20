//
//  MainView.swift
//  NavigationStack-Basic
//
//  Created by Luiz Araujo on 27/02/23.
//

import SwiftUI

struct MainView: View {
    @State private var contents = ContentCreator.preview
    @State private var frameworks = Framework.allCases

    @State private var path = NavigationPath()

    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                List {
                    // MARK: Names
                    Section("Names") {

                        ForEach(contents) { content in
                            NavigationLink(content.name, value: content)
                        }
                    }

                    // MARK: Framework
                    Section("Framework") {
                        ForEach(frameworks, id: \.self) { framework in
                            NavigationLink(framework.rawValue, value: framework)
                        }
                    }
                }
                .navigationDestination(for: ContentCreator.self) { content in
                    Text(content.name)
                }
                .navigationDestination(for: Framework.self) { framework in
                    Text(framework.rawValue)
                }

                Spacer()

                Button("4 Levels Deep") {
                    path.append(contents.randomElement()!)
                    path.append(contents.randomElement()!)
                    path.append(frameworks.randomElement()!)
                    path.append(frameworks.randomElement()!)
                }
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
