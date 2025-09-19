//
//  ImageViewer.swift
//  TesttUI
//
//  Created by N Bhaskar Reddy on 17/09/25.
//

import SwiftUI

struct ImageViewer: View {
    let product: Product
    @State private var isImagePresented = false

    var body: some View {
        TabView {
           // let images = product.images
            ForEach(0..<product.images.count, id: \.self) { index in
                AsyncImage(url: URL(string: product.images[index])) { phase in
                    if let image = phase.image {
                        image.resizable()
                                    .scaledToFit()
                                    .cornerRadius(12)
                                    .frame(width: 360, height: 460)
                                    .onTapGesture {
                                        isImagePresented = true
                                    }
                                    .fullScreenCover(isPresented: $isImagePresented) {
                                        SwiftUIImageViewer(image: image)
                                            .overlay(alignment: .topTrailing) {
                                                closeButton
                                            }
                                    }
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
                    .scaledToFit()
                    .tag(index) // Important for TabView selection
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic)) // Enables swiping and shows page indicators
        .indexViewStyle(.page(backgroundDisplayMode: .interactive)) // Customize indicator appearance
    }
    
    private var image: Image {
            Image("dogs")
        }

        private var closeButton: some View {
            Button {
                
                isImagePresented = false
            } label: {
                Image(systemName: "xmark")
                    .font(.headline)
            }
            .buttonStyle(.bordered)
            .clipShape(Circle())
            .tint(.purple)
            .padding()
        }
}

// To use this in your app, you would embed it in another view:
@available(iOS 17.0.0, *)
#Preview {
    @Previewable @Environment(\.previewProductMockData) var previewProductMockData
    ImageViewer(product: previewProductMockData)
}
