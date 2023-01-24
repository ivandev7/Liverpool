//
//  ProductsViewController.swift
//  Liverpool
//
//  Created by 0xIvan on 23/01/23.
//

import UIKit

class ProductsViewController: UIViewController {
    var mainView: ProductsView { self.view as! ProductsView }
    private var tableViewDataSource: ProductsTableViewDataSource?
    private var tableViewDelagate: ProductsTableViewDelegate?
    private var searchController: SearchController?
    
    override func loadView() {
        self.view = ProductsView()
        
        tableViewDataSource = ProductsTableViewDataSource(tableView: mainView.productsTableview)
        tableViewDelagate = ProductsTableViewDelegate()
        mainView.productsTableview.dataSource = tableViewDataSource
        mainView.productsTableview.delegate = tableViewDelagate
        
        searchController = SearchController()
        searchController?.searchBar.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "Liverpool"
        self.navigationItem.searchController = searchController
        self.definesPresentationContext = true
    }
    
    private func getProductsWithTerm(_ term: String) {
        ProductsAPIClient.shared.getListOfProducts(searchTerm: term, pageNumber: 1) { [weak self] (result: Result<[ProductModel], Error>) in
            switch result {
            case .success(let products): self?.tableViewDataSource?.set(products: products)
            case .failure(let failure): print(failure.localizedDescription)
            }
        }
    }
    
}

extension ProductsViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if let term = searchBar.text, !term.isEmpty {
            getProductsWithTerm(term)
        }
    }
}

