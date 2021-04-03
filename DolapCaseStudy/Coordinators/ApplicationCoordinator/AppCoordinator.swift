//
//  AppCoordinator.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import UIKit

class AppCoordinator: BaseCoordinator<AppViewModel> {
    
    var window = UIWindow(frame: UIScreen.main.bounds)
    
    override func start() {
        window.makeKeyAndVisible()
        loadSplashScreen()
    }
    
    private lazy var commonApplicationLauncher: OnDismissed = { [weak self] in
        self?.launchMainProcess()
    }
    
    // MARK: - Splash Screen Implemententations -
    private func loadSplashScreen() {
        removeChildCoordinators()
        guard let coordinator = AssemblerResolver.resolve(SplashScreenCoordinator.self) else { return }
        start(coordinator: coordinator, with: commonApplicationLauncher)
        
        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.viewContoller, withAnimation: true)
        
    }
    
    private func launchMainProcess() {
        removeChildCoordinators()

        guard let coordinator = AssemblerResolver.resolve(MainViewCoordinator.self) else { return }
        start(coordinator: coordinator)

        ViewControllerUtils.setRootViewController(window: window, viewController: coordinator.navigationController, withAnimation: true)
    }
    
}
