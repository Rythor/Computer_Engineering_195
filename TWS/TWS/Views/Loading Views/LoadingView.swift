//
//  LoadingView.swift
//  TWS
//
//  Created by Brian Tamsing on 5/6/21.
//

import SwiftUI

///
/// A native SwiftUI ProgressView / UIKit UIActivityIndicator.
///
struct LoadingView: View {
    let description: String
    var body: some View {
        ZStack {
            VisualEffectView()
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 5) {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .twsBlue))
                Text(description)
                    .font(.body)
                    .multilineTextAlignment(.center)
            }
            .padding()
        }
    }
}
