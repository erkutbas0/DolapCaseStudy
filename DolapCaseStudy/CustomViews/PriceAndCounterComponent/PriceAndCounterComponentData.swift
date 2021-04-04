//
//  PriceAndCounterComponentData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import Foundation

class PriceAndCounterComponentData {
    
    private(set) var priceLabelData: PriceLabelData
    private(set) var countDownData: CountDownComponentData
    
    init(priceLabelData: PriceLabelData, countDownData: CountDownComponentData) {
        self.priceLabelData = priceLabelData
        self.countDownData = countDownData
    }
    
}
