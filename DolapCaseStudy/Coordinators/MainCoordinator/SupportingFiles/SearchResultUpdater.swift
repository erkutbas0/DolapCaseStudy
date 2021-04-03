//
//  SearchResultUpdater.swift
//  DolapCaseStudy
//
//  Created by Erkut Bas on 3.04.2021.
//

import UIKit

protocol SearchResultUpdaterDelegate: AnyObject {
    func updatedText(with text: String?)
}

class SearchResultUpdater: NSObject, UISearchResultsUpdating {
    
    weak var delegate: SearchResultUpdaterDelegate?
    
    private var searchWorkItem: DispatchWorkItem?
    
    init(delegate: SearchResultUpdaterDelegate) {
        self.delegate = delegate
    }
    
    func updateSearchResults(for searchController: UISearchController) {

        guard let text = searchController.searchBar.text, text.count > 0 else { return }
        
        searchWorkItem?.cancel()
        
        let newTask = DispatchWorkItem { [weak self] in
            self?.delegate?.updatedText(with: text)
        }
        
        self.searchWorkItem = newTask
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: newTask)
        
    }
    
}
