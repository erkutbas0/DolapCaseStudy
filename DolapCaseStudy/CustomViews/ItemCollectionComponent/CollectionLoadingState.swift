//
//  CollectionLoadingState.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation

enum CollectionLoadingState {
    case loading
    case done
    case reloadIndex(IndexPath)
}
