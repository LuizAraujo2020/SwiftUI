//
//  StampView.swift
//  ISDesafioMod03
//
//  Created by Luiz Araujo on 03/03/23.
//

import SwiftUI

struct StampView: View {
    var body: some View {
        VStack {
            Spacer()
            
            ZStack {

                Image(systemName: "heart.fill")
                    .foregroundColor(.red)
                    .font(.largeTitle)
                    .background(
                        Circle()
                            .foregroundColor(.blue)
                            .scaleEffect(1.5)
                    )
                    .scaleEffect(3)

                trademark()

            }
            Spacer()
        }
    }

    @ViewBuilder
    private func trademark() -> some View {
        Text("Irmandade Swift")
            .font(.largeTitle)
            .padding(.horizontal)
            .background(
                Capsule()
                    .foregroundColor(.orange)
            )
            .foregroundColor(.white)
    }
}

struct StampView_Previews: PreviewProvider {
    static var previews: some View {
        StampView()
    }
}
