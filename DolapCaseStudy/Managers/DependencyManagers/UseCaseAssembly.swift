//
//  UseCaseAssembly.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import Foundation
import Swinject
import DomainLayerPackage

class UseCaseAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(ProductUseCase.self, initializer: ProductUseCase.init).inObjectScope(.weak)
        container.autoregister(SocialUseCase.self, initializer: SocialUseCase.init).inObjectScope(.weak)
    }
    
}
