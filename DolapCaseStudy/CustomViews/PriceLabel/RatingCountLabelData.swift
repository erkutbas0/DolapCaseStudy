//
//  RatingCountLabelData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import UIKit

class PriceLabelData {
    
    private(set) var price: Double
    private(set) var textColor: Array<UIColor> = [UIColor.black, UIColor.lightGray]
    private(set) var textFont: Array<UIFont?> = [SourceSansPro.Bold(16).value, SourceSansPro.Regular(14).value]
    private(set) var textAlignment: NSTextAlignment = .left
    
    init(price: Double) {
        self.price = price
    }
    
    func setTextColor(with value: Array<UIColor>) -> Self {
        self.textColor = value
        return self
    }
    
    func setTextFont(with value: Array<UIFont?>) -> Self {
        self.textFont = value
        return self
    }
    
    func setTextAlignment(with value: NSTextAlignment) -> Self {
        self.textAlignment = value
        return self
    }
    
}
