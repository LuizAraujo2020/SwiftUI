//
//  EmptyViewPlaceholder.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import SwiftUI

struct EmptyViewPlaceholder: View {
    
    let type: TypeOfEmptyView
    
    var body: some View {
        GeometryReader { geo in
            // MARK: Shortcuts
            let width  = geo.size.width
            let height = geo.size.height
            /// Gets the smallest dimension, in order to look OK in any orientation.
            let smallest = width <= height ? width : height
            
            VStack {
                Image(systemName: type.image)
                    .symbolRenderingMode(.multicolor)
                    .font(.system(size: smallest * 0.5))
                
                Text(type.message)
                    .font(.system(size: smallest * 0.075))
                    .multilineTextAlignment(.center)
                    .padding(.top, smallest * 0.01)
            }
            .position(x: width * 0.5, y: height * 0.5)
        }
    }
    
    enum TypeOfEmptyView {
        case user, posts, movies
        
        var image: String {
            switch self {
            case .user:
                return String("person.crop.circle.badge.questionmark")
            case .posts:
                return String("bubble.left.and.bubble.right")
            case .movies:
                return String("film.stack")
            }
        }
        
        var message: String {
            switch self {
            case .user:
                return String("No users found, try fetching it up.")
            case .posts:
                return String("No posts found, try reloading it up.")
            case .movies:
                return String("No movie found, try again.")
            }
        }
    }
}

struct EmptyViewPlaceholder_Previews: PreviewProvider {
    static var previews: some View {
        EmptyViewPlaceholder(type: .user)
    }
}
