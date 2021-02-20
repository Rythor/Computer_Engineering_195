//
//  WavyQuoteCard.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import SwiftUI

///
/// Wraps a QuoteCard to provide an animation upon every app launch / QuoteCard coming into the view.
///
struct WavyQuoteCard: View {
    var quote   : Quote
    var color1  : Color
    var color2  : Color
    
    @State private var hasAppeared  : Bool = false
    
    var body: some View {
        ZStack {
            QuoteCard(quote: quote,
                      color1: color1,
                      color2: color2)
        }
        .rotation3DEffect(
            Angle(degrees: hasAppeared ? 0 : 20),
            axis: (x: hasAppeared ? 0 : 1, y: hasAppeared ? 1 : 0, z: 0),
            anchor: .center,
            anchorZ: 0.0,
            perspective: 0.2
        )
        .animation(Animation.easeInOut(duration: 0.8))
        .onAppear {
            hasAppeared = true
        }
    }
}


struct WavyQuoteCard_Previews: PreviewProvider {
    static var previews: some View {
        WavyQuoteCard(quote: MockData.sampleQuotes[0],
                      color1: Gradients.gradients[0][0],
                      color2: Gradients.gradients[0][1])
    }
}
