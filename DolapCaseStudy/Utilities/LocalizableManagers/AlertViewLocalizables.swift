//
//  AlertViewLocalizables.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

enum AlertViewLocalizables: GenericValueProtocol {
    typealias Value = String

    case warningTitle
    case warningSubTitle
    case okButton
    case cancelButton
    
    var value: String {
        switch self {
        case .warningTitle:
            return "warningTitle".toLocalize()
        case .warningSubTitle:
            return "warningSubTitle".toLocalize()
        case .okButton:
            return "okButton".toLocalize()
        case .cancelButton:
            return "cancelButton".toLocalize()
        }
    }
}
