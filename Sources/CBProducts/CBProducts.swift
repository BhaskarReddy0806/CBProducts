// The Swift Programming Language
// https://docs.swift.org/swift-book
import SwiftUI

@available(iOS 13.0.0, *)
@available(macOS 10.15, *)
public struct CBProductsView: View {
    public var title: String

            // Explicitly declare a public initializer
            public init(title: String) {
                self.title = title
            }
    public var body: some View {
        Text("Hello, World! Your Products package is running successfully. \n\n \(self.title)")
        //Test
    }
}
@available(iOS 13.0.0, *)
@available(macOS 10.15, *)
#Preview {
    CBProductsView(title: "Testing")
}
