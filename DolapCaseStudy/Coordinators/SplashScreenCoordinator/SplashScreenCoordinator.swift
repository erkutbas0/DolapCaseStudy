//
//  SplashScreenCoordinator.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import Combine

class SplashScreenCoordinator: BaseCoordinator<SplashScreenViewModel> {

    private var subsriptions = Set<AnyCancellable>()
    
    override func start() {
        guard let viewController = SplashScreenViewController.instantiate() else { return }
        viewController.viewModel = viewModel
        self.viewContoller = viewController
        subscribeSplashViewModelListener()
    }
    
    deinit {
        print("DEINIT SplashScreenCoordinator")
    }
    
    private func subscribeSplashViewModelListener() {
        viewModel.subscribeSplashFinalizeListener { [weak self](finalize) in
            self?.killSplashCoordinator()
        }.store(in: &subsriptions)
    }
    
    private func killSplashCoordinator() {
        parentCoordinator?.didFinish(coordinator: self)
    }
}

