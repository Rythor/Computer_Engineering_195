//
//  QuoteDetailView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import SwiftUI

///
/// Provides a Quote's details (ranging from window type, to color, dimensions, etc.)
///
/// Will be presented as a Modal on the Recent's screen when the user taps on a card.
///
struct QuoteDetailView: View {
    let quote                           : Quote
    let quoteIndex                      : Int
    
    @Binding var isShowingDetailView    : Bool
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    QuoteCard(quote: quote,
                              colorOne: Gradients.gradients[quoteIndex % Gradients.gradients.count][0],
                              colorTwo: Gradients.gradients[quoteIndex % Gradients.gradients.count][1])
                    Spacer()
                    Text("insert actual details here...")
                        .multilineTextAlignment(.center)
                    Spacer()
                }
                .padding()
                .navigationTitle("Quote Details")
                .navigationBarItems(leading: Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "chevron.backward")
                        .font(.title2)
                        .foregroundColor(Color(.label))
                        .frame(width: 36, height: 36)
                        .background(Color(UIColor.secondarySystemBackground).opacity(0.5))
                        .mask(Circle())
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
