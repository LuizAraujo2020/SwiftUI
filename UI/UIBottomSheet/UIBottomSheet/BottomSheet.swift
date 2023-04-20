//
//  BottomSheet.swift
//  UIBottomSheet
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct BottomSheet: View {
    @State var translation: CGSize = .zero
    @State var offsetY: CGFloat    = .zero
    @Binding var show: Bool

    var body: some View {
        ZStack {
            content
        }
    }

    var content: some View {
        GeometryReader { proxy in
            let height = proxy.size.height

            VStack {
                BottomSheetContentView()
                    .overlay(alignment: .topTrailing) {
                        Button {
                            withAnimation {
                                show.toggle()
                            }
                        } label: {

                            Image(systemName: "xmark")
                                .foregroundColor(.white)
                                .bold()
                                .padding(9)
                                .background(Color.accentColor)
                                .mask(Circle())
                                .padding()
                        }
                    }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(.white)
            .mask { RoundedRectangle(cornerRadius: 30, style: .continuous) }
            .offset(y: translation.height + offsetY)
            .gesture(
                DragGesture()
                    .onChanged { value in
                        translation = value.translation
                    }
                    .onEnded({ value in
                        withAnimation(.interactiveSpring()) {
                            let snap = translation.height + offsetY
                            let quarter = height * 0.25

                            if snap > quarter && snap < quarter * 3 {
                                offsetY = quarter * 2

                            } else if snap > quarter * 3 {
                                offsetY = quarter * 3

                            } else {
                                offsetY = 0.0
                            }

                            translation = .zero
                        }
                    })
            )
            .ignoresSafeArea(edges: .bottom)
        }
    }
}

struct BottomSheet_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheet(show: .constant(true))
            .background(.blue)
    }
}
