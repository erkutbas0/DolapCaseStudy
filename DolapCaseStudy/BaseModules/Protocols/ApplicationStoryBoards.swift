//
//  ApplicationStoryBoards.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

enum ApplicationStoryBoards: GenericValueProtocol {
    
    typealias Value = String
    
    case main
    case splashScreen
    case itemDetail
    case alert
    
    var value: String {
        switch self {
        case .main:
            return "Main"
        case .splashScreen:
            return "SplashScreen"
        case .itemDetail:
            return "ItemDetail"
        case .alert:
            return "Alert"
        }
    }
    
}
