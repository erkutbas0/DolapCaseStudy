//
//  ItemCollectionCell.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

protocol ItemCollectionCellProtocol {
    var isItemSelected: Bool { get }
}

struct ItemCollectionCellModel: ItemCollectionCellProtocol {
    var isItemSelected: Bool
    let infoViewData: TitleInfoViewComponentData
    let imageContainer: CustomImageViewComponentData
}

class ItemCollectionCell: BaseCollectionViewCell {
    
    private var itemView: ItemView!
    
    override func addMajorViews() {
        super.addMajorViews()
        addItemView()
    }
    
    private func addItemView() {
        itemView = ItemView()
        itemView.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(itemView)
        
        NSLayoutConstraint.activate([
        
            itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            itemView.topAnchor.constraint(equalTo: contentView.topAnchor),
            itemView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
            
        ])
    }
    
    func setupCell(with data: ItemCollectionCellProtocol)
    {
        guard let data = data as? ItemCollectionCellModel else { return }
        itemView.setData(data: data)
        
    }

    
}

