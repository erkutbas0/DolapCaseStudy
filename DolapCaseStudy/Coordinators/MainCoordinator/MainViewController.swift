//
//  MainViewController.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit
import Combine

class MainViewController: BaseViewController<MainViewModel> {
    
    private var subscriptions = Set<AnyCancellable>()

    private var itemCollectionComponent: ItemCollectionComponent!
    private var dimmingView: DimmingView!
    
    private var mainCollectionComponent: MainCollectionComponent!
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        setupViewConfigurations()
        addMainCollectionComponent()
        addViewModelListeners()
        viewModel.getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupViewConfigurations() {
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    }

    private func addMainCollectionComponent() {
        mainCollectionComponent = MainCollectionComponent()
        mainCollectionComponent.setDelegate(self)
        mainCollectionComponent.translatesAutoresizingMaskIntoConstraints = false
        
        view.addSubview(mainCollectionComponent)
        
        NSLayoutConstraint.activate([
        
            mainCollectionComponent.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            mainCollectionComponent.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            mainCollectionComponent.topAnchor.constraint(equalTo: view.topAnchor),
            mainCollectionComponent.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
        ])
    }
    
    private func addViewModelListeners() {
        viewModel.listenData { [weak self](data) in
            switch data {
            case .done:
                self?.mainCollectionComponent.reloadComponent(with: true)
            default:
                return
            }
        }.store(in: &subscriptions)
    }

}

extension MainViewController: MainCollectionComponentDelegate {
    
    func getNumberOfItem() -> Int {
        return viewModel.getNumberOfItem()
    }
    
    func getItem(at index: IndexPath) -> GenericDataProtocol? {
        return viewModel.getItem(at: index)
    }
    
    func getHeaderInfo(at index: IndexPath) -> GenericDataProtocol? {
        return viewModel.getHeaderData()
    }
    
}
