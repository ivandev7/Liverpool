//
//  ProductsTableViewDataSource.swift
//  Liverpool
//
//  Created by 0xIvan on 23/01/23.
//

import Foundation
import UIKit

final class ProductsTableViewDataSource: NSObject, UITableViewDataSource {
    private let tableView: UITableView
    
    private(set) var products: [ProductModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    init(tableView: UITableView, products: [ProductModel] = []) {
        self.tableView = tableView
        self.products = products
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ProductCell", for: indexPath) as! ProductCell
        
        let product = products[indexPath.row]
        cell.configure(product)
        
        return cell
    }
    
    func set(products: [ProductModel]) {
        self.products = products
    }
}
