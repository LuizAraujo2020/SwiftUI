//
//  ContentView.swift
//  CarroCeu
//
//  Created by Luiz Araujo on 10/01/23.
//

import SwiftUI

struct ContentView: View {
    struct Card: Identifiable {
        let id = UUID()
        var index: Int
        var color = Color.random()
    }
    
    /// Indicates the elements in evidence
    @State var currentIndex = 1
    @State var cards = [Card(index: 0),
                        Card(index: 1),
                        Card(index: 2),
                        Card(index: 3),
                        Card(index: 4),
                        Card(index: 5),
                        Card(index: 6),
                        Card(index: 7),
                        Card(index: 8),
                        Card(index: 9)]
    
    var body: some View {
        VStack {
            HStack {
                buttonLeft
                
                Text("\(currentIndex)")
                    .font(.largeTitle)
                
                buttonRight
            }
            
            ZStack {
                ForEach(cards) { card in
                    // To prevent unused instances, only intanciates the ones that is about to appear, kind of LazyGrids...
                    if card.index >= currentIndex - 2 && card.index <= currentIndex + 3 {
                        createCard(number: card.index)
                            .offset(x: getPosX(pos: card.index))
                            .zIndex(getPosZ(pos: card.index))
                            .scaleEffect(CGSize(width: getPosZ(pos: card.index),
                                                height: getPosZ(pos: card.index)))
                    }
                }
            }
        }
    }
    
    var buttonRight: some View {
        
        Button {
            if currentIndex < cards.count - 1 {
                withAnimation(.spring()) {
                    currentIndex += 1
                }
            }
            
        } label: {
            Image(systemName: "chevron.right.square.fill")
                .font(.system(size: 50))
                .symbolRenderingMode(.multicolor)
        }
    }
    
    var buttonLeft: some View {
        
        Button {
            if currentIndex > 0 {
                withAnimation(.linear) {
                    currentIndex -= 1
                }
            }
            
        } label: {
            Image(systemName: "chevron.left.square.fill")
                .font(.system(size: 50))
                .symbolRenderingMode(.multicolor)
        }
    }
    
    @ViewBuilder
    func createCard(number: Int, size: CGFloat = 200) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 12)
                .foregroundColor(Color.random())
                .frame(width: size, height: size * 1.3)
            
            Text("\(number)")
                .font(.system(size: 300))
        }
    }
    
    /// <#Description#>
    /// - Parameter size: <#size description#>
    /// - Returns: <#description#>
    func createEmptyCard(size: CGFloat = 200) -> some View {
        RoundedRectangle(cornerRadius: 12)
            .foregroundColor(.clear)
            .frame(width: size, height: size * 1.3)
    }
    
    func getPosX(pos: Int) -> CGFloat {
        var control = -3
        var posAux = CGFloat(350)

        for _ in 1...5 {
            control += 1

            posAux -= 150

            if pos == currentIndex - control {
                return CGFloat(posAux)

            }
        }
        
        return UIScreen.main.bounds.size.width * 6
    }
    
    func getPosZ(pos: Int) -> CGFloat {
        var control = -3
        var sizeAux = 0.6
        
        for _ in 1...5 {
            control += 1
            sizeAux += 0.1
            
            if pos == currentIndex - control {
                return CGFloat(sizeAux)
                
            }
        }
        
        return CGFloat(0.1)
    }
}

public extension Color {
    
    static func random(randomOpacity: Bool = false) -> Color {
        Color(
            red: .random(in: 0...1),
            green: .random(in: 0...1),
            blue: .random(in: 0...1),
            opacity: randomOpacity ? .random(in: 0...1) : 1
        )
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
