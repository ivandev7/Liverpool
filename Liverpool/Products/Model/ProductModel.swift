//
//  ProductModel.swift
//  Liverpool
//
//  Created by 0xIvan on 23/01/23.
//

import Foundation

struct ProductModel: Decodable {
    let productDisplayName: String
    let listPrice: Double
    let promoPrice: Double
    let lgImage: String
    let variantsColor: [VariantsColor]
}
