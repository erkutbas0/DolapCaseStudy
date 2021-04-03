//
//  AlertButton.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class AlertButton: UIButton {
    
    private var data: AlertButtonData
    private var buttonPressed: (() -> Void)?
    
    init(data: AlertButtonData) {
        self.data = data
        super.init(frame: .zero)
        setupViewConfigurations()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func setupViewConfigurations() {
        heightAnchor.constraint(equalToConstant: 50).isActive = true
        widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        backgroundColor = data.backgroundColor
        layer.borderWidth = 1
        layer.cornerRadius = 6
        layer.borderColor = data.borderColor.cgColor
        layer.shadowColor = UIColor.gray.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 0.6;
        layer.shadowRadius = 2;
        
        setTitle(data.buttonTitle, for: .normal)
        setTitleColor(data.titleTextColor, for: .normal)
        titleLabel?.font = FontManager.SourceSansPro.SemiBold(18).value
        addTarget(self, action: .buttonAction, for: .touchUpInside)
    }
    
    @objc fileprivate func buttonAction(_ sender: UIButton) {
        buttonPressed?()
        data.actionBlock?()
    }
    
    func listenButtonAction(by completion: @escaping () -> Void) -> Self {
        buttonPressed = completion
        return self
    }
    
}

fileprivate extension Selector {
    static let buttonAction = #selector(AlertButton.buttonAction)
}
