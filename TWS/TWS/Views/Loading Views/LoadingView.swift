//
//  LoadingView.swift
//  TWS
//
//  Created by Brian Tamsing on 5/6/21.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        ZStack {
            Color(.systemBackground)
                .edgesIgnoringSafeArea(.all)
            ProgressView()
                .progressViewStyle(CircularProgressViewStyle(tint: .twsBlue))
        }
    }
}
