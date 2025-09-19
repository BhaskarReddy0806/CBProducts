//
//  CBApisClent.swift
//  TesttUI
//
//  Created by N Bhaskar Reddy on 12/09/25.
//

import Foundation

enum CBApiDomain: String {
    case test = "https://api.escuelajs.co/api/v1";
    case production = "https://api.escuelajs.co/api/v2";
    //case beta = "https://api.escuelajs.co/api/v1"
}

enum ApisEndPoints: String {
    case productsList = "/products"
}

@available(macOS 10.15, *)
@available(iOS 16.0, *)
struct HTTPClient {
    func getListOfProducts(endPoint: String?) async throws -> [Product] {
        
        guard let urlString = endPoint, let url = URL(string: urlString) else {
            print("Invalid empty URL")
            return []
        }
        
        let (responseData, _) = try await URLSession.shared.data(from: url)
        let productsListData = try JSONDecoder().decode([Product].self, from: responseData)
        print(productsListData)
        return productsListData
    }
}
