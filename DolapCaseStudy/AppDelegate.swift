//
//  AppDelegate.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate, AssemblerResolverDelegate {

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        startAppCoordinator()
        return true
    }
    
    private func startAppCoordinator() {
        guard let appCoordinator = returnResolver().resolve(AppCoordinator.self) else { return }
        appCoordinator.start()
    }


}

