//
//  MainCollectionComponentHeaderView.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class MainCollectionComponentHeaderView: BaseCollectionHeaderView {
    
    lazy var detailImageView: UIImageView = {
        let temp = UIImageView()
        temp.translatesAutoresizingMaskIntoConstraints = false
        temp.contentMode = .scaleAspectFill
        temp.image = #imageLiteral(resourceName: "sampleImage")
//        temp.layer.shadowColor = UIColor.gray.cgColor
//        temp.layer.shadowOffset = .zero
//        temp.layer.shadowOpacity = 1;
//        temp.layer.shadowRadius = 2;
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
    
}
