//
//  ProductGalleryPaginationView.swift
//  TesttUI
//
//  Created by N Bhaskar Reddy on 17/09/25.
//

import SwiftUI

struct ProductGalleryViewPagination: View {
    internal var product: Product
    var cellIndex: Int
    
    var body: some View {
        //NavigationStack {
           // ScrollView {
                    //ForEach(Array(product.images.enumerated()), id: \.offset) { index, productImage in
        ImageViewer(product: product)
                       // ProductImageViewCell(productImage: image)
                    .onTapGesture {
                       // ProductCellViewCourosel(productImage: productImage)
                    }
           // }
       // }
        .navigationTitle("swipe and see other images")
    }
}

struct ProductImageViewCell: View {
    var productImage: String
    var body: some View {
        VStack(alignment: .leading) {
            VStack {
                AsyncImage(url: URL(string: productImage)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            //.aspectRatio(contentMode: .fill)
                    } else if phase.error != nil {
                        // Display a placeholder when loading failed
                        Image("emptyPlaceholder")
                            .resizable()
                            .frame(height: 150)
                            .foregroundColor(.gray)
                            .background(alignment: .center) {
                                
                            }
                    } else {
                        // Display a placeholder while loading
                        Image("comingSoon")
                            .resizable()
                            .frame(height: 250)
                    }
                }
            }
        }
    }
}

@available(iOS 17.0.0, *)
#Preview {
    @Previewable @Environment(\.previewProductMockData) var previewProductMockData
    ProductGalleryViewPagination(product: previewProductMockData, cellIndex: 1)
}
