//
//  CountDownComponentData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import Foundation

class CountDownComponentData {
    
    private(set) var resetBlock: VoidOperation?
    
    func setResetBlock(by value: VoidOperation?) -> Self {
        self.resetBlock = value
        return self
    }
    
}
