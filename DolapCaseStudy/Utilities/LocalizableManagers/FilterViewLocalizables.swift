//
//  FilterViewLocalizables.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

enum FilterViewLocalizables: GenericValueProtocol {
    
    typealias Value = String
    
    case cancel
    case movie
    case music
    case podcast
    case all
    
    var value: String {
        switch self {
        case .cancel:
            return "cancel".toLocalize()
        case .movie:
            return "movie".toLocalize()
        case .music:
            return "music".toLocalize()
        case .podcast:
            return "podcast".toLocalize()
        case .all:
            return "all".toLocalize()
        }
    }
    
}
