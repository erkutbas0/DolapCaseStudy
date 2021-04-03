//
//  MainViewController.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

class MainViewController: BaseViewController<MainViewModel> {

    private var itemCollectionComponent: ItemCollectionComponent!
    private var dimmingView: DimmingView!
    
    override func prepareViewControllerConfigurations() {
        super.prepareViewControllerConfigurations()
        setupViewConfigurations()
        //viewModel.getData()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    private func setupViewConfigurations() {
        view.backgroundColor = #colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)
    }
    
    
}
