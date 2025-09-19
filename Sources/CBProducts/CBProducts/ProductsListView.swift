//
//  ProductsListView.swift
//  TesttUI
//
//  Created by N Bhaskar Reddy on 12/09/25.
//

import SwiftUI
import Foundation

@available(macOS 10.15, *)
@available(iOS 17.0.0, *)
public struct ProductsListContainer: View {
    @Environment(\.httpClient) var httpClient
    @State var products: [Product]
    
    var title: String
    
    // Explicitly declare a public initializer
    public init(title: String, products: [Any]) {
        self.title = title
        self.products = products as? [Product] ?? []
    }
    
    public var body: some View { // This is required
        // Your view hierarchy goes here
        //if #available(macOS 12.0, *) {
        NavigationStack {
            ProductsListView(products: products)
                .task {
                    do {
                        let productsListEndPoint = CBApiDomain.test.rawValue + ApisEndPoints.productsList.rawValue
                        self.products = try await httpClient.getListOfProducts(endPoint: productsListEndPoint)
                    } catch {
                        print("Error: \(error)")
                    }
                }.navigationTitle("Products List")
                .navigationBarTitleDisplayMode(.automatic)
        }
        
        // } else {
        // Fallback on earlier versions
        // }
    }
}

@available(iOS 16.0, *)
public struct ProductsListView: View {
    var products: [Product]
    func selectedProduct(product: Product) {
       
            
       // }
    }
    public var body: some View {
        NavigationStack {
            List() {
                ForEach(products) { product in
                    productCellView(product: product)
                }
            }
        }
    }
}

@available(iOS 16.0, *)
public struct productCellView: View {
    @State private var isSelectedItem: Bool = false
    var product: Product
    public var body: some View {
        VStack(alignment: .leading) {
            VStack {
                AsyncImage(url: URL(string: product.images[0])) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                    } else if phase.error != nil {
                        // Display a placeholder when loading failed
                        Image("emptyPlaceholder")
                            .resizable()
                            .frame(height: 150)
                    } else {
                        // Display a placeholder while loading
                        Image("comingSoon")
                            .resizable()
                            .frame(height: 250)
                    }
                }
            }
            VStack {
                HStack {
                    Text("\(product.title)")
                        .font(.headline)
                }
                Text("Price: $\(product.price)")
                    .font(.title3)
                HStack {
                    Text("Description: \(product.description)")
                        .lineLimit(2)
                        .font(.subheadline)
                }
            }
        }.onTapGesture {
            isSelectedItem.toggle()
        }
        .navigationDestination(isPresented: $isSelectedItem) {
            ProductDetailView(product: product)
            //ProductsViewPagination(product: product)
           /* NavigationLink(product.title, destination: ProductsViewPagination(product: product))
                .navigationTitle(product.title)
                .navigationBarTitleDisplayMode(.large)
            */

        }
        
        
        
    }
}
@available(iOS 17.0, *)
#Preview {
    ProductsListContainer(title: "Test", products: [MockProductData().previewProduct()])
}
