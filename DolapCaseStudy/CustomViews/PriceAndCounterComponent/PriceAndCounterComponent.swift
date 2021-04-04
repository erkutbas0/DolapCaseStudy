//
//  PriceAndCounterComponent.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 4.04.2021.
//

import UIKit

class PriceAndCounterComponent: GenericBaseView<PriceAndCounterComponentData> {
    
    lazy var containerView: UIView = {
        let temp = UIView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.backgroundColor = .green
        return temp
    }()
    
    private lazy var mainStackView: UIStackView = {
        let temp = UIStackView(arrangedSubviews: [priceInfo, counterComponent])
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.isUserInteractionEnabled = true
        temp.alignment = .center
        temp.distribution = .fill
        temp.axis = .horizontal
        return temp
    }()
    
    lazy var priceInfo: PriceLabel = {
        let temp = PriceLabel()
        temp.translatesAutoresizingMaskIntoConstraints = false
        return temp
    }()
    
    lazy var counterComponent: CountDownComponent = {
        let temp = CountDownComponent()
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
            mainStackView.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            mainStackView.topAnchor.constraint(equalTo: containerView.topAnchor),
            mainStackView.bottomAnchor.constraint(equalTo: containerView.bottomAnchor),
        
        ])
    }

    override func loadDataToView() {
        super.loadDataToView()
        guard let data = returnData() else { return }
        priceInfo.setLabelData(data: data.priceLabelData)
        counterComponent.setData(data: data.countDownData)
    }
    
}
