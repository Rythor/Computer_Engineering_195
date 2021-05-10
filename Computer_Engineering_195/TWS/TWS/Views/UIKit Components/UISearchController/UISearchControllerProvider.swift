//
//  UISearchControllerProvider.swift
//  TWS
//
//  Created by Brian Tamsing on 3/30/21.
//

import SwiftUI

final class UISearchControllerProvider: NSObject, ObservableObject {
    // MARK: - Properties
    let searchController        = UISearchController()
    @Published var text         = ""
    @Published var isSearching  = false
    
    // MARK: Init
    init(placeholder: String?) {
        super.init()
        self.searchController.searchBar.placeholder = placeholder ?? "Search"
        configureSearchController()
    }
    
    // MARK: - Methods
    func configureSearchController() {
        searchController.obscuresBackgroundDuringPresentation   = false
        searchController.searchResultsUpdater                   = self
    }
}


// MARK: - UISearchResultsUpdating Methods

extension UISearchControllerProvider: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        guard let text = searchController.searchBar.text, !text.isEmpty else {
            DispatchQueue.main.async {
                self.isSearching = false
            }
            return
        }
        
        DispatchQueue.main.async {
            self.isSearching = true
            self.text = text.lowercased()
        }
    }
}
