//
//  ShareLinkView.swift
//  TesttUI
//
//  Created by N Bhaskar Reddy on 16/09/25.
//

import SwiftUI

@available(iOS 16.0, *)
struct ShareLinkView: View {
    var body: some View {
        ShareLink(item: URL(string: "https://stackoverflow.com/")!, message: Text("share_invite_message")){
            Label("Share", systemImage: "square.and.arrow.up")
                .foregroundStyle(.blue)
                .font(.headline)
        }
        .buttonStyle(.plain)  // <--- for macOS as well
        .simultaneousGesture(TapGesture().onEnded {
            print("----> tap detected")
        })
    }
}

@available(iOS 16.0, *)
#Preview {
    ShareLinkView()
}
