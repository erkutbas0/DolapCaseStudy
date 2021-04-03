//
//  ItemCollectionViewFlowLayoutData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class ItemCollectionViewFlowLayoutData {
    
    private(set) var itemHeight: CGFloat = 80
    private(set) var minimumWidth: CGFloat = 300
    private(set) var lineSpacing: CGFloat = 15
    private(set) var edgeInset: CGFloat = 10

    func setItemHeight(by value: CGFloat) -> Self {
        self.itemHeight = value
        return self
    }
    
    func setMinimumWidth(by value: CGFloat) -> Self {
        self.minimumWidth = value
        return self
    }
    
    func setLineSpacing(by value: CGFloat) -> Self {
        self.lineSpacing = value
        return self
    }
    
    func setEdgeInset(by value: CGFloat) -> Self {
        self.edgeInset = value
        return self
    }
    
}
