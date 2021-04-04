//
//  ProductDetailComponentData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

class ProductDetailComponentData: GenericDataProtocol {
    
    private(set) var productHeaderComponentData: ProductHeaderComponentData
    private(set) var ratingInfoComponentData: RatingInfoComponentData
    private(set) var priceAndCounterComponentData: PriceAndCounterComponentData
    
    init(productHeaderComponentData: ProductHeaderComponentData, ratingInfoComponentData: RatingInfoComponentData, priceAndCounterComponentData: PriceAndCounterComponentData) {
        self.productHeaderComponentData = productHeaderComponentData
        self.ratingInfoComponentData = ratingInfoComponentData
        self.priceAndCounterComponentData = priceAndCounterComponentData
    }
    
}
