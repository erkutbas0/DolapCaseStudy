//
//  AssemblerResolverDelegate.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import Swinject

protocol AssemblerResolverDelegate {
    
}

extension AssemblerResolverDelegate {
    func returnResolver() -> Resolver {
        return Assembler.sharedAssembler.resolver
    }
}

