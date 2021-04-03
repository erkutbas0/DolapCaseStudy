//
//  MainViewCoordinator.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit
import DomainLayerPackage

class MainViewCoordinator: BaseCoordinator<MainViewModel> {
    
    override func start() {
        navigationController.viewControllers = [MainViewController(viewModel: viewModel)]
    }
    
    
}

// MARK: - ssemblerResolverDelegate  -
extension MainViewCoordinator: AssemblerResolverDelegate {
    
}
