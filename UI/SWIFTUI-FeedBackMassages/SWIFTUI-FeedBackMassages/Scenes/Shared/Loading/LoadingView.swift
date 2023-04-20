//
//  LoadingView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct LoadingView: View {
    
    var body: some View {
        GeometryReader { geo in
            /// The smallest dimension.
            let smallest = geo.size.width <= geo.size.height ? geo.size.width : geo.size.height
           
            /// The size of the content. To make sure it doesn't cover all the space availabe and doesn't get off screen.
            let contentSize = CGSize(width: smallest * 0.75, height: smallest)
            
            ZStack {
                createBackground(size: contentSize.width)
                
                createGraphic(size: contentSize)
                
                createText(size: contentSize)
            }
            .frame(width: contentSize.width, height: contentSize.height)
            .position(x: geo.size.width * 0.5, y: geo.size.height * 0.5)
        } /// end: Geo
    }
    
    @ViewBuilder
    private func createBackground(size: CGFloat) -> some View {
        RoundedRectangle(cornerRadius: size * 0.1)
            .foregroundStyle(Color.darkModeDark)
            .opacity(0.8)
    }
    
    @ViewBuilder
    private func createGraphic(size: CGSize) -> some View {
        VStack {
            LottieView(lottieFile: Constants.Animations.fileNameloading)
                .frame(width: size.width)
                .offset(y: size.height * -0.1)
                .clipped()
        }
    }
    
    @ViewBuilder
    private func createText(size: CGSize) -> some View {
        Text("Loading")
            .font(.system(size: size.width * 0.15, weight: .heavy, design: .rounded))
            .foregroundColor(Color.textLightGray)
            .offset(y: size.height * 0.2)
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
            .background(.red)
    }
}
