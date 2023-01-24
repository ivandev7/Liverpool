//
//  SearchController.swift
//  Liverpool
//
//  Created by 0xIvan on 23/01/23.
//

import Foundation
import UIKit

class SearchController: UISearchController {
    
    override func viewDidLoad() {
        self.obscuresBackgroundDuringPresentation = false
        self.searchBar.placeholder = "Buscar"
        self.searchBar.autocapitalizationType = .none
        self.searchBar.tintColor = .systemPink
        self.searchBar.searchTextField.leftView?.tintColor = .systemPink
    }
}
