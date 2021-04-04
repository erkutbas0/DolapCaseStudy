//
//  RatingStarComponentData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class RatingStarComponentData {
    var starCount: Int = 0
    var starSpacing: CGFloat = 0.0
    var imageSize: CGSize = CGSize(width: 10, height: 10)
    var filledImage: String
    var emptyImage: String

    init(starCount: Int = 0, starSpacing: CGFloat = 0.0, imageSize: CGSize = CGSize(width: 10, height: 10), filledImage: String, emptyImage: String) {
        self.starCount = starCount
        self.starSpacing = starSpacing
        self.imageSize = imageSize
        self.filledImage = filledImage
        self.emptyImage = emptyImage
    }
}
