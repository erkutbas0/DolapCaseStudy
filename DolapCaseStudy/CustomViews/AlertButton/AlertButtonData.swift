//
//  AlertButtonData.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class AlertButtonData {
    private(set) var buttonTitle: String
    private(set) var titleTextColor: UIColor = #colorLiteral(red: 0.1148234084, green: 0.1298957467, blue: 0.1381868422, alpha: 1)
    private(set) var backgroundColor: UIColor = #colorLiteral(red: 0.1148234084, green: 0.1298957467, blue: 0.1381868422, alpha: 1)
    private(set) var borderColor: UIColor = #colorLiteral(red: 0.1148234084, green: 0.1298957467, blue: 0.1381868422, alpha: 1)
    private(set) var actionBlock: (() -> Void)?
    
    init(buttonTitle: String, backgroundColor: UIColor) {
        self.buttonTitle = buttonTitle
        self.backgroundColor = backgroundColor
    }
    
    func setTitleTextColor(by value: UIColor) -> Self {
        self.titleTextColor = value
        return self
    }
    
    func setBorderColor(by value: UIColor) -> Self {
        self.borderColor = value
        return self
    }
    
    func setActionBlock(by value: (() -> Void)?) -> Self {
        self.actionBlock = value
        return self
    }
}

class AlertViewData {
    private(set) var icon: UIImage
    private(set) var title: String
    private(set) var subTitle: String
    private(set) var buttons: [AlertButtonData]?
    
    init(icon: UIImage, title: String, subTitle: String) {
        self.icon = icon
        self.title = title
        self.subTitle = subTitle
    }
    
    func setButtons(by value: [AlertButtonData]?) -> Self {
        self.buttons = value
        return self
    }
    
}
