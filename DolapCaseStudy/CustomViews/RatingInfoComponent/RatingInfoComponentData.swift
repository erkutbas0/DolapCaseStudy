//
//  RatingInfoComponentData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

class RatingInfoComponentData {
    
    private(set) var ratingData: RatingInfoComponentData
    private(set) var commentCount: String
    
    init(ratingData: RatingInfoComponentData, commentCount: String) {
        self.ratingData = ratingData
        self.commentCount = commentCount
    }
    
}
