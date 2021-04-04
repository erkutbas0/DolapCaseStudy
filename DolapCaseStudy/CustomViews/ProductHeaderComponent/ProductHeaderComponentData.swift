//
//  ProductHeaderComponentData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

class ProductHeaderComponentData {
    
    private(set) var infoLabeldata: ProductInfoLabelData = ProductInfoLabelData(name: "Takasi", description: "Bom Bom")
    
    init(infoLabeldata: ProductInfoLabelData) {
        self.infoLabeldata = infoLabeldata
    }
    
}
