//
//  ExpandableTextView.swift
//  TesttUI
//
//  Created by N Bhaskar Reddy on 15/09/25.
//

import SwiftUI
import CoreFoundation
struct ExpandableTextView: View {
    let fullText: String
    @State private var isExpanded = false
    let initialLineLimit = 3

    var body: some View {
        VStack(alignment: .leading) {
            Text(fullText)
                .lineLimit(isExpanded ? nil : initialLineLimit) // Expand or collapse
                .animation(.easeInOut, value: isExpanded) // Smooth animation

            if !isExpanded {
                Button("Read More") {
                    isExpanded.toggle()
                }
            } else if isExpanded {
                Button("Show Less") {
                    isExpanded.toggle()
                }
            }
        }
    }
}

// Helper extension to estimate number of lines (basic example)
extension String {
    func numberOfLines() -> Int {
        let nsString = self as NSString
        let size = CGSize(width: CGFloat.greatestFiniteMagnitude, height: CGFloat.greatestFiniteMagnitude)
        //CGSize(width: .greatestFiniteMagnitude, height: .greatestFiniteMagnitude)
        let boundingRect = nsString.boundingRect(
            with: size,
            options: .usesLineFragmentOrigin,
            attributes: [.font: UIFont.preferredFont(forTextStyle: .body)], // Adjust font as needed
            context: nil
        )
        return Int(ceil(boundingRect.height / UIFont.preferredFont(forTextStyle: .body).lineHeight))
    }
}

#Preview {

        ExpandableTextView(fullText: "This is a very long piece of text that needs to be expanded and collapsed to improve the user interface and readability. It demonstrates how to implement this functionality in SwiftUI with a 'Read More' and 'Show Less' button.")
            .padding()
}
