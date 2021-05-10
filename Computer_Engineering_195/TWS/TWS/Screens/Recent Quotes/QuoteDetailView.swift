//
//  QuoteDetailView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import SwiftUI

///
/// Provides a Quote's details.
///
/// Will be presented as a Modal on the Recent's screen when the user taps on a card.
///
struct QuoteDetailView: View {
    let quote                           : QuoteSummary
    let quoteIndex                      : Int
    
    @Binding var isShowingDetailView    : Bool
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack(spacing: 5) {
                    QuoteCard(quote: quote,
                              color1: Gradients.gradients[quoteIndex % Gradients.gradients.count][0],
                              color2: Gradients.gradients[quoteIndex % Gradients.gradients.count][1])
                    Spacer()
                }
                .padding()
                .navigationTitle("Quote Details")
                .navigationBarItems(leading: Button {
                    isShowingDetailView = false
                } label: {
                    BackArrow()
                })
            }
            .background(Color(UIColor.systemBackground))
        }
    }
}

struct QuoteDetailView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteDetailView(quote: MockData.sampleQuotes[0],
                        quoteIndex: 0,
                        isShowingDetailView: .constant(true))
    }
}
