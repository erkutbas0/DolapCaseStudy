//
//  MainCoordinatorAssembly.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import Swinject
import SwinjectAutoregistration

class MainCoordinatorAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(MainViewCoordinator.self, initializer: MainViewCoordinator.init).inObjectScope(.weak)
        container.autoregister(MainViewModel.self, initializer: MainViewModel.init).inObjectScope(.weak)
    }
    
}
