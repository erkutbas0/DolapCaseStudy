//
//  HeaderView.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021
//

import UIKit

class HeaderView: BaseView {
    
    lazy var detailImageView: CustomImageViewComponentContainer = {
        let temp = CustomImageViewComponentContainer()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.shadowColor = UIColor.gray.cgColor
        temp.layer.shadowOffset = .zero
        temp.layer.shadowOpacity = 1;
        temp.layer.shadowRadius = 2;
        return temp
    }()
    
    lazy var shadowContainerView: UIView = {
        let temp = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height / 3))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    lazy var blurView: UIVisualEffectView = {
        let effect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let temp = UIVisualEffectView(effect: effect)
        temp.isUserInteractionEnabled = false
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.layer.masksToBounds = true
        temp.alpha = 0
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addViews()
    }
    
}

// MARK: - major functions -
extension HeaderView {
    
    private func addViews() {
        addSubview(detailImageView)
        addSubview(shadowContainerView)
        addSubview(blurView)
        
        NSLayoutConstraint.activate([
            
            detailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailImageView.topAnchor.constraint(equalTo: topAnchor),
            detailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            shadowContainerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            shadowContainerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            shadowContainerView.topAnchor.constraint(equalTo: topAnchor),
            shadowContainerView.heightAnchor.constraint(equalToConstant: shadowContainerView.frame.height),
            
            blurView.leadingAnchor.constraint(equalTo: leadingAnchor),
            blurView.trailingAnchor.constraint(equalTo: trailingAnchor),
            blurView.topAnchor.constraint(equalTo: topAnchor),
            blurView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
    }
    
    private func addGradientColor() {
        let gradient = CAGradientLayer()
        gradient.frame = shadowContainerView.bounds
        gradient.colors = [#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1).cgColor, UIColor.clear.cgColor]
        gradient.locations = [0.0, 1.0]
        shadowContainerView.layer.insertSublayer(gradient, at: 0)
    }
    
    func blurViewActivationManager(active: Bool) {
        UIView.transition(with: self.blurView, duration: 0.3, options: .transitionCrossDissolve, animations: {
            if active {
                self.blurView.alpha = 1
            } else {
                self.blurView.alpha = 0
            }
        }, completion: nil)
    }
    
    func setImages(urlString: String) {
        detailImageView.setData(data: CustomImageViewComponentData(imageUrl: urlString)
                                    .setContentMode(by: .scaleAspectFit)
                                    .setLoadingType(by: .disk))
    }
    
    func setImages(with data: ImageLoadingOptions) {
        detailImageView.setData(data: CustomImageViewComponentData(imageUrl: data.url)
                                    .setContentMode(by: .scaleAspectFit)
                                    .setLoadingType(by: .disk)
                                    .setImageId(by: data.imageId!))
    }
    
}
