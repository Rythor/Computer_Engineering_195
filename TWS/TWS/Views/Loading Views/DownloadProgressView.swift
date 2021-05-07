//
//  DownloadProgressView.swift
//  TWS
//
//  Created by Brian Tamsing on 5/6/21.
//

import SwiftUI

///
/// An animated, circular, percent-based progress view.
///
struct DownloadProgressView: View {
    @Binding var downloadProgress: Float
    var body: some View {
        ZStack {
            Color(.systemBackground)
            Circle()
                .stroke(lineWidth: 10)
                .opacity(0.3)
                .foregroundColor(.twsBlue)
            Circle()
                .trim(from: 0.0, to: CGFloat(downloadProgress))
                .stroke(style: StrokeStyle(lineWidth: 10,
                                           lineCap: .round,
                                           lineJoin: .round))
                .foregroundColor(.twsBlue)
                .rotationEffect(Angle(degrees: 270))
                .animation(.linear)
            Text(String(format: "%.0f %%", downloadProgress * 100))
                .font(.title)
        }
        .frame(width: 150, height: 150)
    }
}

struct DownloadProgressView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadProgressView(downloadProgress: .constant(0.3))
    }
}