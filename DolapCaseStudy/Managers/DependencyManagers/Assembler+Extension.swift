//
//  Assembler+Extension.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import Swinject

extension Assembler {
    
    static let sharedAssembler: Assembler = {
        
        let container = Container()
        
        let assembler = Assembler(
            
            [ManagerAssemby(),
             CaseStudyAssembly(),
             MainCoordinatorAssembly(),
             SplashCoordinatorAssembly(),
             AppCoordinatorAssembly(),
             UseCaseAssembly(),
             RepositoryAssembly()],
            container: container)
        
        return assembler
        
    }()
    
}
