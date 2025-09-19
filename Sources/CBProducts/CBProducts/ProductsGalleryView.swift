//
//  ProductsViewPagination.swift
//  TesttUI
//
//  Created by N Bhaskar Reddy on 13/09/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct ProductsGalleryView: View {
    internal var product: Product
    
    var body: some View {
        //NavigationStack {
            ScrollView {
                LazyVGrid(columns: Array(repeating: GridItem(.flexible(minimum: 100)), count: 3), spacing: 20) {
                    ForEach(Array(product.images.enumerated()), id: \.offset) { index, productImage in
                        ProductThumbnailCellView(product: product, productImage: productImage, cellIndex: index)
                    }
                    .onTapGesture {
                        
                    }
                }
            }
       // }
        .navigationTitle("Gallery View")
    }
}

@available(iOS 16.0, *)
struct ProductThumbnailCellView: View {
    
    @State private var isSelected: Bool = false
    internal var product: Product

    var productImage: String
    var cellIndex: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                AsyncImage(url: URL(string: productImage)) { phase in
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
                .onTapGesture {
                    isSelected.toggle()
                }
                .navigationDestination(isPresented: $isSelected) {
                    ProductGalleryViewPagination(product: product, cellIndex: cellIndex)
                }
            }
        }
    }
}
@available(iOS 17.0.0, *)
#Preview {
    @Previewable @Environment(\.previewProductMockData) var previewProductMockData
    ProductsGalleryView(product: previewProductMockData)
}
