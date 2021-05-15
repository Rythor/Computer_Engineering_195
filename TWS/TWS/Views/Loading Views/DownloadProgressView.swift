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
        VStack(spacing: 25) {
            ZStack {
                Circle()
                    .stroke(lineWidth: 10)
                    .opacity(0.3)
                    .frame(width: 150, height: 150)
                    .foregroundColor(.twsBlue)
                Circle()
                    .trim(from: 0.0, to: CGFloat(downloadProgress))
                    .stroke(style: StrokeStyle(lineWidth: 10,
                                               lineCap: .round,
                                               lineJoin: .round))
                    .frame(width: 150, height: 150)
                    .foregroundColor(.twsBlue)
                    .rotationEffect(Angle(degrees: 270))
                    .animation(.linear)
                Text(String(format: "%.0f %%", downloadProgress * 100))
                    .font(.title)
            }
            
            Text("Downloading quote...")
                .font(.body)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(VisualEffectView())
        .edgesIgnoringSafeArea(.all)
    }
}

struct DownloadProgressView_Previews: PreviewProvider {
    static var previews: some View {
        DownloadProgressView(downloadProgress: .constant(0.3))
    }
}
