//
//  ProductInfoLabel.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class ProductInfoLabel: BaseDynamicAttributedLabel<ProductInfoLabelData> {
    
    override func loadData() {
        super.loadData()
        
        guard let data = returnData() else { return }
        
        let paragraphStyle = NSMutableParagraphStyle()
        paragraphStyle.alignment = data.textAlignment
        
        var value =  NSMutableAttributedString(string: data.name ?? "", attributes: [.font : data.textFont[0], .foregroundColor: data.textColor[0], .paragraphStyle: paragraphStyle])
        value.append(NSMutableAttributedString(string: "  \(data.description ?? "")" , attributes: [.font : data.textFont[1], .foregroundColor: data.textColor[1], .paragraphStyle: paragraphStyle]))

        self.attributedText = value
        
    }
    
}

