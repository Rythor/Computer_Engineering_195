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
    var body: some View {
        ZStack {
            Color(.clear)
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .twsBlue))
        }
    }
}
