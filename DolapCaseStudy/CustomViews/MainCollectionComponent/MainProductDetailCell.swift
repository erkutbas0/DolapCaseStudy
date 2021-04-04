//
//  MainProductDetailCell.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class MainProductDetailCell: BaseCollectionViewCell {
    
    lazy var productDetailComponent: ProductDetailComponent = {
        let temp = ProductDetailComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    override func setupView() {
        super.setupView()
        contentView.backgroundColor = .white
    }
    
    override func addMajorViews() {
        super.addMajorViews()
        addProductDetailComponent()
    }
    
    private func addProductDetailComponent() {
        contentView.addSubview(productDetailComponent)
        
        NSLayoutConstraint.activate([
        
            productDetailComponent.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            productDetailComponent.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            productDetailComponent.topAnchor.constraint(equalTo: contentView.topAnchor),
            productDetailComponent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        
        ])
    }

    func setupCell(with data: GenericDataProtocol?) {
        productDetailComponent.setData(data: data)
    }
    
}
