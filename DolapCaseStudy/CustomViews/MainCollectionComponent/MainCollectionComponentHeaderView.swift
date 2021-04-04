//
//  MainCollectionComponentHeaderView.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class MainCollectionComponentHeaderView: BaseCollectionHeaderView {
    
    lazy var detailImageView: CustomImageViewComponent = {
        let temp = CustomImageViewComponent()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        return temp
    }()
    
    override func addMajorViews() {
        super.addMajorViews()
        addViews()
    }
    
    private func addViews() {
        addSubview(detailImageView)
        
        NSLayoutConstraint.activate([
            
            detailImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            detailImageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            detailImageView.topAnchor.constraint(equalTo: topAnchor),
            detailImageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
        ])
        
    }
    
    func setup(with data: GenericDataProtocol?) {
        guard let data = data as? MainCollectionComponentHeaderViewData else { return }
        detailImageView.setData(componentData: data.customImageViewComponentData)
    }
    
}
