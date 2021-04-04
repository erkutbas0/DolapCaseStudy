//
//  LikeInfoComponent.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class LikeInfoComponent: GenericBaseView<LikeInfoComponentData> {
    
    lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .cyan
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [likeIcon, likeCount])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 5
        return temp
    }()
    
    lazy var likeIcon: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.heightAnchor.constraint(equalToConstant: 24).isActive = true
        temp.widthAnchor.constraint(equalToConstant: 24).isActive = true
        temp.image = UIImage(imageLiteralResourceName: "heartEmpty")
        return temp
    }()
    
    lazy var likeCount: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponent()
    }
    
    private func addComponent() {
        addSubview(containerView)
        containerView.addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            containerView.heightAnchor.constraint(equalToConstant: 60),
            containerView.widthAnchor.constraint(equalToConstant: 60),
            
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            mainStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
            mainStackView.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
        
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }

        likeCount.text = "\(data.likeCount)"
        
        setLikeIcon()
    }
    
    private func setLikeIcon() {
        guard let data = returnData() else { return }
        
        UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) {
            
            if data.likeCount > 0 {
                self.likeIcon.image = UIImage(imageLiteralResourceName: "heartFilled")
            } else {
                self.likeIcon.image = UIImage(imageLiteralResourceName: "heartEmpty")
            }
            
        }

    }
    
}
