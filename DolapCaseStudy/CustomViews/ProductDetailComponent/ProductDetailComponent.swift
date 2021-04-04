//
//  ProductDetailComponent.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class ProductDetailComponent: GenericBaseView<ProductDetailComponentData> {
    
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
        
            mainStackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            mainStackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        headInfo.setData(data: data.productHeaderComponentData)
    }
    
}
