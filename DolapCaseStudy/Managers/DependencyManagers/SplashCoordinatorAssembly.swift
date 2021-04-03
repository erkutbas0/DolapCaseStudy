//
//  SplashCoordinatorAssembly.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import Swinject

class SplashCoordinatorAssembly: Assembly {
    
    func assemble(container: Container) {
        container.autoregister(SplashScreenCoordinator.self, initializer: SplashScreenCoordinator.init).inObjectScope(.weak)
        container.autoregister(SplashScreenViewModel.self, initializer: SplashScreenViewModel.init).inObjectScope(.weak)
    }
    
}
