//
//  SplashScreenViewModel.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import Combine

class SplashScreenViewModel: BaseViewModelDelegate {
    
    private var splahFinalizeListener = PassthroughSubject<Bool, Never>()
    
    /// Description: This module could be used to get app configuration files,
    /// app initialize process or application session management etc
    func startSplashProcess() {
        
        /*
         let's inform to move forward
         */
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.dismissCoordinator()
        }
    }
    
    func dismissCoordinator() {
        splahFinalizeListener.send(true)
    }
    
    func subscribeSplashFinalizeListener(completion: @escaping OnCompletedBool) -> AnyCancellable {
        return splahFinalizeListener.sink(receiveValue: completion)
    }
    
    deinit {
        print("DEINIT SPLASH VIEW MODEL")
    }
}
