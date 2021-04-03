//
//  ItemCollectionComponentData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

class ItemCollectionComponentData {
    
    private(set) var layoutData: ItemCollectionViewFlowLayoutData = ItemCollectionViewFlowLayoutData()

    func setLayoutData(by value: ItemCollectionViewFlowLayoutData) -> Self {
        self.layoutData = value
        return self
    }
    
}
