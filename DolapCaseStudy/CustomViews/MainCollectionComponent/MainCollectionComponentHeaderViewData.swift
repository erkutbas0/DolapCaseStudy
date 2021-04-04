//
//  MainCollectionComponentHeaderViewData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import Foundation

class MainCollectionComponentHeaderViewData: GenericDataProtocol {
    
    private(set) var customImageViewComponentData: CustomImageViewComponentData
    
    init(customImageViewComponentData: CustomImageViewComponentData) {
        self.customImageViewComponentData = customImageViewComponentData
    }
    
}
