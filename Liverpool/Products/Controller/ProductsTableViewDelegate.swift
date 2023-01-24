//
//  ProductsTableViewDelegate.swift
//  Liverpool
//
//  Created by 0xIvan on 23/01/23.
//

import Foundation
import UIKit

class ProductsTableViewDelegate: NSObject, UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
}
