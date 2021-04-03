//
//  VisualContent.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import UIKit

public enum VisualContents: GenericValueProtocol {
    
    case iconFilter
    case iconDelete
    case iconWarning
    
    typealias Value = UIImage
    
    var value: UIImage {
        switch self {
        case .iconFilter:
            return UIImage(imageLiteralResourceName: "baseline_filter_alt_black_24pt").withRenderingMode(.alwaysTemplate)
        case .iconDelete:
            return UIImage(imageLiteralResourceName: "baseline_delete_forever_black_24pt").withRenderingMode(.alwaysTemplate)
        case .iconWarning:
            return UIImage(imageLiteralResourceName: "iconWarning")
        }
    }
    
}
