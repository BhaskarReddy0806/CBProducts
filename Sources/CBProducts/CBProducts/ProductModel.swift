//
//  ProductModel.swift
//  TesttUI
//
//  Created by N Bhaskar Reddy on 12/09/25.
//

import Foundation
import SwiftUI
import SwiftUICore


@available(iOS 16.0, *)
extension EnvironmentValues {
    @Entry var httpClient = HTTPClient()
    @Entry var previewProductMockData = MockProductData().previewProduct()

}

// MARK: - Hardcode Product data
struct MockProductData: Decodable {
    func previewProduct() -> Product {
        return Product(id: 21, title: "Test", slug: "ccc", price: 32, description: "The actual mechanics behind ViewBuilder are beyond the scope of this article. What’s important here is that we need to initialize our NavigationView, and to do that the Swift compiler will need to first evaluate the contents of that view, the list. But a list is just another struct that needs its own parameters, which means that before Swift can provide the list it needs to evaluate the contents of the list.The actual mechanics behind ViewBuilder are beyond the scope of this article. What’s important here is that we need to initialize our NavigationView, and to do that the Swift compiler will need to first evaluate the contents of that view, the list. But a list is just another struct that needs its own parameters, which means that before Swift can provide the list it needs to evaluate the contents of the list.The actual mechanics behind ViewBuilder are beyond the scope of this article. What’s important here is that we need to initialize our NavigationView, and to do that the Swift compiler will need to first evaluate the contents of that view, the list. But a list is just another struct that needs its own parameters, which means that before Swift can provide the list it needs to evaluate the contents of the list.", category: Category(id: 21, name: "", slug: "", image: "", creationAt: "", updatedAt: ""), images: ["https://i.imgur.com/cHddUCu.jpeg","https://i.imgur.com/CFOjAgK.jpeg","https://i.imgur.com/wbIMMme.jpeg"], creationAt: "", updatedAt: "")
    }
}


// MARK: - Product
struct Product: Decodable, Identifiable {
    let id: Int
    let title, slug: String
    let price: Int
    let description: String
    let category: Category
    let images: [String]
    let creationAt, updatedAt: String
}

// MARK: - Category
struct Category: Decodable {
    let id: Int
    let name, slug: String
    let image: String
    let creationAt, updatedAt: String
}
