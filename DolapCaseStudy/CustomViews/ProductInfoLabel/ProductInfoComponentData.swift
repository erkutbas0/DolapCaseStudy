//
//  ProductInfoLabelData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class ProductInfoLabelData {
    
    private(set) var name: String?
    private(set) var description: String?
    private(set) var textColor: Array<UIColor> = [UIColor.black, UIColor.lightGray]
    private(set) var textFont: Array<UIFont?> = [SourceSansPro.Bold(18).value, SourceSansPro.Regular(16).value]
    private(set) var textAlignment: NSTextAlignment = .left
    
    init(name: String?, description: String?) {
        self.name = name
        self.description = description
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
