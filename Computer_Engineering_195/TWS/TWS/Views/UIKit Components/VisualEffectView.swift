//
//  VisualEffectView.swift
//  TWS
//
//  Created by Brian Tamsing on 3/26/21.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: .systemChromeMaterial))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        // ...
    }
}
