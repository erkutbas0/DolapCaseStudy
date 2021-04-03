//
//  DimmingView.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class DimmingView: BaseView {
    
    private lazy var container: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return view
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let temp = UIActivityIndicatorView(style: .gray)
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addViews()
    }
    
    private func addViews() {
        addSubview(container)
        container.addSubview(activityIndicator)
        
        NSLayoutConstraint.activate([
        
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.topAnchor.constraint(equalTo: topAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            activityIndicator.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            activityIndicator.centerXAnchor.constraint(equalTo: container.centerXAnchor),
            
        ])
        
    }
    
    private func startIndicatingActivity() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.startAnimating()
        }
        
    }
    
    private func stopIndicatingActivity() {
        DispatchQueue.main.async { [weak self] in
            self?.activityIndicator.stopAnimating()
        }
    }
    
    func activationManager(activate: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) { [weak self] in
                if activate {
                    self?.startIndicatingActivity()
                    self?.alpha = 1
                } else {
                    self?.stopIndicatingActivity()
                    self?.alpha = 0
                }
            }
        }
        

    }
    
}
