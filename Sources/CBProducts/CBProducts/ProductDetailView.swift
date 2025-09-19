//
//  ProductDetailView.swift
//  TesttUI
//
//  Created by N Bhaskar Reddy on 15/09/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct ProductDetailView: View {
    @State private var isSelectedItem = false
    @State private var isDetailsSelected = false
    
    var product: Product
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .center) {
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
                VStack(alignment: .leading) {
                    HStack(alignment: .firstTextBaseline) {
                        Text("\(product.title)")
                            .font(.largeTitle)
                        Spacer()
                        Button(action: {
                            isDetailsSelected.toggle()
                        }, label: {
                            Label("View Gallery", systemImage: "photo")
                        })
                        .padding(.trailing)
                        .navigationDestination(isPresented: $isDetailsSelected) {
                            ProductsGalleryView(product: product)
                        }
                    }
                    HStack(alignment: .firstTextBaseline) {
                        Text("Price: $\(product.price)")
                            .font(.title3)
                        Spacer()
                            ShareLinkView()
                        .padding(.trailing)
                        
                    }
                    
                    VStack(alignment: .leading) {
                        Text("Description: ")
                            .font(.title)
                        
                            .frame(height: 40)
                        ExpandableTextView(fullText: product.description)
                        Text("Price: $\(product.price)")
                            .font(.title3)
                    }
                    
                }
            }
            .padding(.all)
        }        
    }
}

@available(iOS 16.0, *)
#Preview {
    ProductDetailView(product: MockProductData().previewProduct())
}
