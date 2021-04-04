//
//  RatingInfoComponentData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

class RatingInfoComponentData {
    
    private(set) var commentCount: CommentCountLabelData = CommentCountLabelData(count: 10)
    
    init(commentCount: CommentCountLabelData) {
        self.commentCount = commentCount
    }
    
}
