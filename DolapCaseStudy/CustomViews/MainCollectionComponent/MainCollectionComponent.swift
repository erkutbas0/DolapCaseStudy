//
//  MainCollectionComponent.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class MainCollectionComponent: GenericBaseView<MainCollectionComponentData> {
 
    lazy var collectionView: UICollectionView = {
        let layout = MainComponentHeaderLayout()
        layout.scrollDirection = .vertical
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .white
        collection.contentInsetAdjustmentBehavior = .never
        collection.dataSource = self
        collection.delegate = self
        return collection
    }()
    
    override func addMajorFields() {
        super.addMajorFields()
        addCollectionView()
    }
    
    override func setupViews() {
        super.setupViews()
        registerCells()
    }
    
    private func registerCells() {
        collectionView.genericRegisterCell(MainProductDetailCell.self)
        collectionView.register(MainCollectionComponentHeaderView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainCollectionComponentHeaderView.identifier)
    }
    
    private func addCollectionView() {
        addSubview(collectionView)
        
        NSLayoutConstraint.activate([
        
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor),
            collectionView.topAnchor.constraint(equalTo: topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: bottomAnchor),
        
        ])
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource -
extension MainCollectionComponent: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainProductDetailCell.identifier, for: indexPath) as? MainProductDetailCell else { fatalError() }
        cell.backgroundColor = .yellow
        
        cell.setupCell(with: ProductDetailComponentData(productHeaderComponentData: ProductHeaderComponentData(infoLabeldata: ProductInfoLabelData(name: "TAKASI", description: "BOM BOM"))))
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: MainCollectionComponentHeaderView.identifier, for: indexPath)
        header.backgroundColor = .brown
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 180)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: UIScreen.main.bounds.width, height: 340)
    }
    
}
