//
//  ContentView.swift
//  ISDesafioMod06
//
//  Created by Luiz Araujo on 04/03/23.
//

import SwiftUI

struct ContentView: View {
    @State private var debugAlign = TextAlignment.leading
    @State private var showDebug  = false
    @State private var showList   = true
    @State private var debugList  = [String]()

    private let mainTitle = ("ESTADOS", "BRASIL")
    private let states    = ["DF": "Distrito Federal",
                             "SP": "São Paulo",
                             "ES": "Espírito Santo",
                             "SC": "Santa Catarina",
                             "RJ": "Rio de Janeiro"]

    var body: some View {
        VStack {

            // MARK: - Top Buttons
            /// Button to show/hide Debug Messages
            Button(showDebug ? "Hide Debug" : "Show Debug",
                   role: showDebug ? .destructive : .none) {

                showDebug.toggle()

                if showDebug { fulfillDebugList() }
            }

            Divider()

            /// Button to show/hide the List of States
            Button(showList ? "Hide List" : "Show List",
                   role: showList ? .destructive : .none) {

                showList.toggle()
            }

            // MARK: - List of States
            if showList {
                List {
                    Section("\(mainTitle.0) DO \(mainTitle.1)") {
                        ForEach(states.sorted(by: <), id: \.key) { state in
                            if !debugList.contains(state.key) {
                                HStack {
                                    createTextStateAndAbbreviation(key: state.key, value: state.value)

                                    Spacer()

                                    createShowIndicatorIcon(key: state.key)
                                }
                                .onTapGesture {
                                    toggleItemDebugList(key: state.key)
                                }
                                .onDisappear {
                                    printDisappearedStates(key: state.key, value: state.value)
                                }
                            }
                        }
                    }
                }
                // MARK: Alignment Button
                .overlay(alignment: .topTrailing) {
                    createAlignButton()
                        .padding(.top, 5)
                        .padding(.trailing, 24)
                }
                // MARK: Life Cycle
                .onAppear {
                    printStates()
                }
            }

            Spacer()
        }
        // MARK: - OnChanges
        .onChange(of: showDebug) { newValue in
            if !newValue {
                debugList.removeAll()
            }
        }
        .onChange(of: debugList) { newValue in
            if newValue.isEmpty {
                showDebug = false
            }

            if newValue.count == states.count {
                showDebug = true
            }
        }
        // MARK: - Animations
        .animation(.easeInOut, value: debugList)
        .animation(.easeInOut, value: showDebug)
        .animation(.easeInOut, value: showList)
    }

    // MARK: - Elements
    @ViewBuilder
    private func createShowIndicatorIcon(key: String) -> some View {
        Image(systemName: debugList.contains(key) ? "checkmark.seal": "xmark.seal")
            .symbolVariant(.fill)
            .imageScale(.large)
            .foregroundColor(debugList.contains(key) ? .green : .red)
    }

    @ViewBuilder
    private func createAlignButton() -> some View {
        Button {
            debugAlign = alignmentNext()

        } label: {
            switch debugAlign {

                case .leading:
                    Image(systemName: "align.horizontal.left.fill")
                        .frame(width: 25)
                case .center:
                    Image(systemName: "align.horizontal.center.fill")
                        .frame(width: 25)
                case .trailing:
                    Image(systemName: "align.horizontal.right.fill")
                        .frame(width: 25)
            }
        }
        .padding(5)
        .foregroundColor(Color.white)
        .background(
            Color.accentColor
                .cornerRadius(8)
        )
    }

    @ViewBuilder
    private func createTextStateAndAbbreviation(key: String, value: String) -> some View {
        HStack {
            Text(value)
            Text("(" + key + ")")
        }
    }
}


// MARK: - Methods
extension ContentView {

    /// Puts in/out the item from the **Debug List**.
    /// - Parameter key: the State key to be inserted/removed.
    private func toggleItemDebugList(key: String) {
        if debugList.contains(key) {
            debugList = debugList.filter { $0 != key }
        } else {
            debugList.append(key)
        }
    }

    /// Fills the list with all elements from the **States** `dictionary`.
    private func fulfillDebugList() {
        debugList.removeAll()

        for key in states.keys {
            debugList.append(key)
        }
    }

    /// Sets alignment to texts, indicated to `body` texts only.
    /// - Returns: the alignment setted.
    private func alignmentNext() -> TextAlignment {
        switch debugAlign {

            case .leading:  return .center
            case .center:   return .trailing
            case .trailing: return .leading
        }
    }
}

// MARK: - Prints & Helpers
extension ContentView {
    var maxChar: Int { 80 }

    /// Prints the States on onAppear.
    private func printStates() {
        printGenerateHeader(title: mainTitle.0)

        for state in states {
            printGenerateBody(lineText: "\(state.key) - \(state.value)", alignment: debugAlign)
        }
        printGenerateFooter()
    }

    /// Prints the States on the Debug List
    private func printDisappearedStates() {
        printGenerateHeader(title: "DESAPARECEU")

        if debugList.isEmpty {
            printGenerateBody(lineText: "")
            printGenerateBody(lineText: "TUDO", alignment: debugAlign)
            printGenerateBody(lineText: "")

        } else {
            for state in states where debugList.contains(state.key) {
                printGenerateBody(lineText: "\(state.key) - \(state.value)", alignment: debugAlign)
            }
        }

        printGenerateFooter()
    }

    /// Prints the States on the Debug List
    private func printDisappearedStates(key: String, value: String) {
        printGenerateHeader(title: "DESAPARECEU")

        printGenerateBody(lineText: "\(key) - \(value)", alignment: debugAlign)

        printGenerateFooter()
    }

    private func printCalculateComplement(text: String, alignment: TextAlignment) -> (leading: Int, trailing: Int) {

        var result = (leading: 0, trailing: 0)

        // 1. Counts the chars and gets the complementary chars amount.
        let charCount = text.count
        let complementaryCount = maxChar - charCount

        switch alignment {

                // 2. Gets the leading amount of complement
            case .leading:
                result.leading = 0
                result.trailing = complementaryCount

                // 3. Gets the center amount of complement
            case .center:
                let half = Int(complementaryCount / 2)

                result.leading  = half
                result.trailing = half

                if complementaryCount % 2 != 0 { result.trailing += 1 }

                // 4. Gets the trailing amount of complement
            case .trailing:
                result.leading = complementaryCount
                result.trailing = 0
        }

        return result
    }

    private func printGenerateHeader(title: String, alignment: TextAlignment = .center) {
        var result = "\n\n"

        let complements = printCalculateComplement(text: title, alignment: alignment)

        result  = String(repeating: "-", count: complements.leading)
        result += title
        result += String(repeating: "-", count: complements.trailing)

        print(result)
    }

    private func printGenerateBody(lineText: String, alignment: TextAlignment = .leading) {
        var result = ""

        let complements = printCalculateComplement(text: lineText, alignment: alignment)

        result  = String(repeating: " ", count: complements.leading)
        result += lineText
        result += String(repeating: " ", count: complements.trailing)

        print(result)
    }

    private func printGenerateFooter(lineText: String = "", alignment: TextAlignment = .center) {
        var result = ""

        let complements = printCalculateComplement(text: lineText, alignment: alignment)

        result  = String(repeating: "-", count: complements.leading)
        result += lineText
        result += String(repeating: "-", count: complements.trailing)

        print(result)

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
