//
//  ProductCell.swift
//  Liverpool
//
//  Created by 0xIvan on 23/01/23.
//

import Foundation
import UIKit
import SDWebImage

class ProductCell: UITableViewCell {
    let productImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let productName: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 20)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let productListPrice: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = UIColor.lightGray.withAlphaComponent(0.8)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    let productPromoPrice: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 18)
        label.textColor = UIColor.systemPink.withAlphaComponent(0.8)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let colorView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .systemPink
        view.layer.borderWidth = 2
        view.layer.borderColor = UIColor.black.cgColor
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    var constraintLeading: NSLayoutConstraint?
    
    required init?(coder: NSCoder) {
        fatalError("init(coder: ) has not been implemented")
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
    }
    
    private func setupViews() {
        self.addSubview(productImageView)
        self.addSubview(productName)
        self.addSubview(productListPrice)
        self.addSubview(productPromoPrice)
        self.addSubview(colorView)
    }
    
    private func setupConstraints() {
        productImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        productImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 12).isActive = true
        productImageView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        productImageView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        
        productName.leadingAnchor.constraint(equalTo: productImageView.trailingAnchor, constant: 20).isActive = true
        productName.topAnchor.constraint(equalTo: productImageView.topAnchor).isActive = true
        productName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        productListPrice.leadingAnchor.constraint(equalTo: productName.leadingAnchor).isActive = true
        productListPrice.topAnchor.constraint(equalTo: productName.bottomAnchor, constant: 10).isActive = true
        productListPrice.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        productPromoPrice.leadingAnchor.constraint(equalTo: productListPrice.leadingAnchor).isActive = true
        productPromoPrice.topAnchor.constraint(equalTo: productListPrice.bottomAnchor, constant: 10).isActive = true
        productPromoPrice.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12).isActive = true
        
        constraintLeading = colorView.leadingAnchor.constraint(equalTo: productPromoPrice.leadingAnchor)
        constraintLeading?.isActive = true
        colorView.topAnchor.constraint(equalTo: productPromoPrice.bottomAnchor, constant: 10).isActive = true
        colorView.widthAnchor.constraint(equalToConstant: 20).isActive = true
        colorView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        colorView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12).isActive = true
    }
    
    func configure(_ model: ProductModel) {
        if let url = URL(string: model.lgImage) {
            productImageView.sd_setImage(with: url)
        }
        productName.text = model.productDisplayName
        productListPrice.text = "$\(model.listPrice)"
        
        if model.promoPrice != 0.0 {
            productPromoPrice.text = "$\(model.promoPrice)"
            productListPrice.textColor = UIColor.lightGray.withAlphaComponent(0.8)
        } else {
            productPromoPrice.text = ""
            productListPrice.textColor = UIColor.systemPink.withAlphaComponent(0.9)
        }
        
        for _ in model.variantsColor.enumerated() {
            self.addSubview(colorView)
        }
    }
}
