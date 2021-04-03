//
//  AppCoordinatorAssembly.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import Swinject

class AppCoordinatorAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(AppCoordinator.self, initializer: AppCoordinator.init).inObjectScope(.container)
        container.autoregister(AppViewModel.self, initializer: AppViewModel.init).inObjectScope(.container)
    }
    
}
