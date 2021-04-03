//
//  CoordinatorDelegate.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

protocol CoordinatorDelegate: AnyObject {
    func dismissCoordinator()
    func fireAlert(with data: AlertViewData)
}

extension CoordinatorDelegate {
    func fireAlert(with data: AlertViewData) { }
}
