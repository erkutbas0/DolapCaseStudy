//
//  ProductDetailComponentData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

class ProductDetailComponentData {
    
    private(set) var productHeaderComponentData: ProductHeaderComponentData
    private(set) var ratingInfoComponentData: RatingInfoComponentData
    
    init(productHeaderComponentData: ProductHeaderComponentData, ratingInfoComponentData: RatingInfoComponentData) {
        self.productHeaderComponentData = productHeaderComponentData
        self.ratingInfoComponentData = ratingInfoComponentData
    }
    
}
