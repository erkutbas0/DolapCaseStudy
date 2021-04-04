//
//  RatingInfoComponent.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class RatingInfoComponent: GenericBaseView<RatingInfoComponentData> {
 
    private lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [ratingCountLabel, ratingView, commentCount])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .horizontal
        temp.spacing = 5
        return temp
    }()
    
    private lazy var ratingCountLabel: UILabel = {
        let temp = UILabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.widthAnchor.constraint(equalToConstant: 24).isActive = true
        temp.text = "0.0"
        temp.font = SourceSansPro.SemiBold(16).value
        temp.textColor = #colorLiteral(red: 0.9960784314, green: 0.7725490196, blue: 0, alpha: 1)
        return temp
    }()
    
    private lazy var ratingView: RatingStarComponent = {
        let temp = RatingStarComponent(frame: .zero, starStackViewData: RatingStarComponentData(starCount: 5, starSpacing: 3, imageSize: CGSize(width: 10, height: 10), filledImage: "smallStarFilled", emptyImage: "smallStarEmpty"))
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = false
        return temp
    }()
    
    lazy var commentCount: CommentCountLabel = {
        let temp = CommentCountLabel()
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
        
            containerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            containerView.trailingAnchor.constraint(equalTo: trailingAnchor),
            containerView.topAnchor.constraint(equalTo: topAnchor),
            containerView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            mainStackView.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            mainStackView.trailingAnchor
                .constraint(equalTo: containerView.trailingAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
        
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        commentCount.setLabelData(data: data.commentCount)
        ratingCountLabel.text = "\(Double(data.ratingCount))"
        ratingView.setStarRatingExternally(index: data.ratingCount)
    }
    
}
