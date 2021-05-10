//
//  Toast.swift
//  TWS
//
//  Created by Brian Tamsing on 3/25/21.
//

import SwiftUI

struct Toast<Presenting>: View where Presenting: View {
    @Binding var isPresenting   : Bool
    
    let presentingView          : () -> Presenting
    let item                    : AlertItem
    
    var body: some View {
        ZStack(alignment: .center) {
            self.presentingView()
                .blur(radius: isPresenting ? 1 : 0)
                .disabled(isPresenting)
                
            VStack(spacing: 15) {
                Image(systemName: item.image)
                    .font(.title)
                    .foregroundColor(item.imageColor)
                item.message
                    .font(.body)
                    .bold()
                    .multilineTextAlignment(.center)
            }
            .padding()
            .frame(width: 145, height: 140)
            .foregroundColor(Color.primary)
            .background(VisualEffectView())
            .cornerRadius(10)
            .transition(.opacity)
            .opacity(isPresenting ? 1 : 0)
        }
    }
}
