//
//  BottomSheetView.swift
//  UIBottomSheet
//
//  Created by Luiz Araujo on 08/03/23.
//

import SwiftUI

struct BottomSheetView: View {
    @State var translation: CGSize = .zero
    @State var offsetY: CGFloat = .zero
    @Binding var show: Bool

    var body: some View {
        ZStack {
            GeometryReader { proxy in
                VStack {
                    BottomSheetContentView()
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .background(.white)
                .mask(RoundedRectangle(cornerRadius: 50, style: .continuous))
                .offset(y: translation.height + offsetY)
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            translation = value.translation
                        })
                        .onEnded({ value in
                            withAnimation(.interactiveSpring()) {
                                let snap = translation.height + offsetY
                                let quarter = proxy.size.height * 0.4
                            }
                        })
                )
            }
        }
    }
}

struct BottomSheetView_Previews: PreviewProvider {
    static var previews: some View {
        BottomSheetView(show: .constant(false))
    }
}
