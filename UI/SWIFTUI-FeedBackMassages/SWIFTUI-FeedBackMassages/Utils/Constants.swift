//
//  Constants.swift
//  SWIFTUI-FeedBackMassages
//
//  Created by Luiz Araujo on 09/02/23.
//

import Foundation

struct Constants {
    struct Animations {
        static let duration       = Double(2.0)
        static let randomDuration = Double.random(in: 0.25..<duration)
        static let startDegrees   = Double(0.0)
        static let endDegrees     = Double(1080.0)
        
        static let fileNameloading = "loading"
    }
    
    struct Texts {
        static let loremMicro  = "Lorem Ipsum"
        static let loremSmall  = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
        static let loremMedium = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. "
        static let loremBig    = "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."
    }
    
    struct Misc {
        static let opacityEmptyView = Double(0.5)
    }
}
