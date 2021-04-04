//
//  MainCollectionComponent.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

protocol MainCollectionComponentDelegate: AnyObject {
    func getNumberOfItem() -> Int
    func getItem(at index: IndexPath) -> GenericDataProtocol?
    func getHeaderInfo(at index: IndexPath)
}

class MainCollectionComponent: GenericBaseView<MainCollectionComponentData> {
    
    private weak var delegate: MainCollectionComponentDelegate?
 
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
    
    func setDelegate(_ delegate: MainCollectionComponentDelegate) {
        self.delegate = delegate
    }
    
    func reloadComponent(with animate: Bool) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if animate {
                UIView.transition(with: self, duration: 0.3, options: .transitionCrossDissolve) {
                    self.collectionView.reloadData()
                }
            }
            self.collectionView.reloadData()
        }
    }
    
}

// MARK: - UICollectionViewDelegate, UICollectionViewDataSource -
extension MainCollectionComponent: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return delegate?.getNumberOfItem() ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let data = delegate?.getItem(at: indexPath) else { fatalError("Please provide data") }
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MainProductDetailCell.identifier, for: indexPath) as? MainProductDetailCell else { fatalError() }
        cell.backgroundColor = .yellow
        
        cell.setupCell(with: data)
//        cell.setupCell(with: ProductDetailComponentData(productHeaderComponentData: ProductHeaderComponentData(infoLabeldata: ProductInfoLabelData(name: "TAKASI", description: "BOM BOM")), ratingInfoComponentData: RatingInfoComponentData(commentCount: CommentCountLabelData(count: 10)), priceAndCounterComponentData: PriceAndCounterComponentData(priceLabelData: PriceLabelData(price: 180.0), countDownData: CountDownComponentData())))
        
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
