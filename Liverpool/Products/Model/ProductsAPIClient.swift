//
//  ProductsAPIClient.swift
//  Liverpool
//
//  Created by 0xIvan on 23/01/23.
//

import Foundation
import UIKit

final class ProductsAPIClient {
    static let shared = ProductsAPIClient()
    
    enum ProductsDataTaskError: Error {
        case urlInvalid
    }
    
    private init() { }
    
    func getListOfProducts(searchTerm: String, pageNumber: Int, completion: @escaping (Result<[ProductModel], Error>) -> Void) {
        let urlStr = "https://shoppapp.liverpool.com.mx/appclienteservices/services/v3/plp?search-string=\(searchTerm)&page-number=\(pageNumber)"
        
        guard let urlQuery = urlStr.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
              let url = URL(string: urlQuery) else {
            completion(.failure(ProductsDataTaskError.urlInvalid))
            return
        }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data: Data?, response: URLResponse?, error: Error?) in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            if let data = data,
               let result = try? JSONDecoder().decode(ResultsModelResponse.self, from: data) {
                completion(.success(result.plpResults.records))
            }
        }
        
        task.resume()
    }
}
