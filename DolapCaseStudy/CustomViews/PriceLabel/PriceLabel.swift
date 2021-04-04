//
//  PriceLabel.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import UIKit

class PriceLabel: BaseDynamicAttributedLabel<PriceLabelData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = data.textAlignment
        
        self.attributedText = NSMutableAttributedString(string: "\(data.price) TL", attributes: [.font : data.textFont[0], .foregroundColor: data.textColor[0], .paragraphStyle: paragraphStyle])
        
    }
    
}

