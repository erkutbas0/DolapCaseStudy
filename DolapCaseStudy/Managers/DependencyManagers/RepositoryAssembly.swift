//
//  RepositoryAssembly.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import Foundation
import Swinject
import DomainLayerPackage
import DataLayerPackage

class RepositoryAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(SampleOperationServiceManagerInterface.self, initializer: SampleOperationServiceManager.init).inObjectScope(.weak)
        container.autoregister(SampleOperationApiRemoteInterface.self, initializer: SampleOperationApiRemote.init).inObjectScope(.weak)
        container.autoregister(SampleOperationInterface.self, initializer: SampleOperationRepository.init).inObjectScope(.weak)
    }
    
}
