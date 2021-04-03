//
//  PopOverControllerManager.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import Foundation
import UIKit

class PopOverControllerManager : NSObject, UIPopoverPresentationControllerDelegate {
    
    private static let shared = PopOverControllerManager()
    
    private override init() {
        super.init()
    }
    
    func adaptivePresentationStyle(for controller: UIPresentationController) -> UIModalPresentationStyle {
        return .none
    }
    
    static func configurePresentation(forController controller : UIViewController) -> UIPopoverPresentationController {
        
        controller.modalPresentationStyle = .popover
        
        let presentationController = controller.presentationController as! UIPopoverPresentationController
        presentationController.sourceRect = CGRect(origin: .zero, size: CGSize(width: 300, height: 250)) 
        presentationController.delegate = PopOverControllerManager.shared
        
        return presentationController
    }
    
}
