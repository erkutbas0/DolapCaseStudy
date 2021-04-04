//
//  ProductDetailComponent.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class ProductDetailComponent: GenericBaseView<GenericDataProtocol> {
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [headInfo, ratingInfoComponent, priceAndCounterComponent])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .fill
        temp.distribution = .fill
        temp.axis = .vertical
        temp.spacing = 5
        return temp
    }()
    
    lazy var headInfo: ProductHeaderComponent = {
        let temp = ProductHeaderComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var ratingInfoComponent: RatingInfoComponent = {
        let temp = RatingInfoComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var priceAndCounterComponent: PriceAndCounterComponent = {
        let temp = PriceAndCounterComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addComponent()
    }
    
    private func addComponent() {
        addSubview(mainStackView)
        
        NSLayoutConstraint.activate([
        
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            mainStackView.topAnchor.constraint(equalTo: topAnchor, constant: 16),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16),
        
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() as? ProductDetailComponentData else { return }
        headInfo.setData(data: data.productHeaderComponentData)
        ratingInfoComponent.setData(data: data.ratingInfoComponentData)
        priceAndCounterComponent.setData(data: data.priceAndCounterComponentData)
    }
    
}
