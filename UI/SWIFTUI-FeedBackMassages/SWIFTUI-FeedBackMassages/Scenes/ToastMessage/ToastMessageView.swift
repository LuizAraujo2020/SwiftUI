//
//  ToastMessageView.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct ToastMessageView: View {
    @EnvironmentObject var appState: AppState
    private let client = MovieClient()
    @State var movies = [Movie]()
    @State private var showMessage = false
    
    var body: some View {
        ZStack {
            if movies.isEmpty {
                EmptyViewPlaceholder(type: .movies)
                    .opacity(Constants.Misc.opacityEmptyView)
                
            } else {
                List(movies, id: \.backdrop_path) { movie in
                    Text(movie.title ?? "NO title")
                }
            }
            
            if let msg = appState.message, showMessage {
                FeedbackMessageView(showMessage: $showMessage, message: msg)
            }
        }
        .onAppear {
            /// Forces a error
            if Bool.random() {
                appState.message = .init(error: APIError.allCases.randomElement()!)
                
            } else {
                showMessage      = false
                appState.message = nil
                
                client.getFeed(from: .topRated) { result in
                    switch result {
                    case .success(let movieFeedResult):
                        
                        guard let movieResults = movieFeedResult?.results else { return }
                        print(movieResults)
                        
                        movies = movieResults
                        
                    case .failure(let error):
                        print("the error \(error)")
                    }
                }
            }
        } // End: onAppear
        .onChange(of: appState.message) { newValue in
            showMessage = newValue != nil
        }
    }
}

struct ToastMessageView_Previews: PreviewProvider {
    static var previews: some View {
        ToastMessageView()
    }
}
