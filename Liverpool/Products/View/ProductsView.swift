//
//  ProductsView.swift
//  Liverpool
//
//  Created by 0xIvan on 23/01/23.
//

import Foundation
import UIKit

class ProductsView: UIView {
    let productsTableview: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(ProductCell.self, forCellReuseIdentifier: "ProductCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 600
        return tableView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {
        self.addSubview(productsTableview)
    }
    
    private func setupConstraints() {
        productsTableview.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        productsTableview.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        productsTableview.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        productsTableview.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
    }
}
