//
//  ContentView.swift
//  ISDesafioMod04
//
//  Created by Luiz Araujo on 03/03/23.
//

import SwiftUI

struct ContentView: View {
    @State var movies = Movie.mock

    /// Pictures
    private let headerPic  = "Wallpaper"
    private let picProfile = "Happy_Smile"
    private let movieThumb = "Movie_Clap_Cell"

    /// Colors
    private let background = "background"

    /// Shortcuts
    private let width = UIScreen.main.bounds.width

    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                Image(headerPic)
                    .resizable()
                    .scaledToFit()
                    .frame(width: width)

                Color(background)
            }
            .ignoresSafeArea()

            VStack {
                Image(picProfile)
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: width * 0.46511627906976744)
                    .offset(y: (width * 0.46511627906976744) * 0.3)

                Spacer()
            }

            VStack {
                Spacer()

                createMovieList(title: "Assistidos", movies: movies)
                    .padding(.bottom, 20)

                createMovieList(title: "Na Fila", movies: movies)
                    .padding(.bottom, 20)
            }
        }
    }

    @ViewBuilder
    private func createMovieList(title: String, movies: [Movie]) -> some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.largeTitle)
                .foregroundColor(.white)

            HStack(spacing: width * 0.035) {
                ForEach(movies) { movie in

                    Image(movieThumb)
                        .resizable()
                        .clipShape(RoundedRectangle(cornerRadius: 15))
                        .frame(width: width * 0.2708860759493671,
                               height: (width * 0.5063291139240507))
                }
            }
        }
    }
}

struct Movie: Identifiable {
    let id = UUID()
    let title: String

    static let mock: [Movie] = [.init(title: "Jack Reacher"),
                                .init(title: "Avengers"),
                                .init(title: "Jumanji")]
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
