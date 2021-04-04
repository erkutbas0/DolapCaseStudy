//
//  CommentCountLabel.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import UIKit

class CommentCountLabel: BaseDynamicAttributedLabel<CommentCountLabelData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData(), let count = data.count else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = data.textAlignment
        
        self.attributedText = NSMutableAttributedString(string: "( \(count) Yorum )", attributes: [.font : data.textFont[0], .foregroundColor: data.textColor[0], .paragraphStyle: paragraphStyle])
        
    }
    
}
