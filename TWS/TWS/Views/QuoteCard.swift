//
//  QuoteCard.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import SwiftUI

///
/// Represents a quote in a card shaped view.
///
struct QuoteCard: View {
    var quote                       : Quote
    var colorOne                    : Color
    var colorTwo                    : Color
    
    var body: some View {
        VStack {
            HeaderView(quote: quote)
            Spacer()
            RedactedInfoView()
        }
        .padding()
        .frame(height: 220)
        .background(RadialGradient(gradient: Gradient(colors: [colorOne, colorTwo]),
                                   center: .topLeading,
                                   startRadius: 5,
                                   endRadius: 500))
        .opacity(0.9)
        .clipShape(RoundedRectangle(cornerRadius: 20, style: .continuous))
        .shadow(color: colorTwo.opacity(0.3), radius: 20, y: 10)
    }
}


// MARK: - Previews
struct QuoteCard_Previews: PreviewProvider {
    static var previews: some View {
        QuoteCard(quote: MockData.sampleQuotes[0],
                  colorOne: Gradients.gradients[0][0],
                  colorTwo: Gradients.gradients[0][1])
    }
}


// MARK: - CARD COMPONENTS

// MARK: - Header View
struct HeaderView: View {
    let quote: Quote
    
    var body: some View {
        HStack(alignment: .top) {
            VStack(alignment: .leading, spacing: 4) {
                Text(quote.client)
                    .font(.title2)
                Text("1 Infinite Loop, Cupertino CA")
                    .font(.subheadline)
            }
            Spacer()
            Image(systemName: "info.circle")
                .frame(width: 32, height: 32)
                .background(Color.white.opacity(0.2))
                .mask(Circle())
                .shadow(radius: 30)
        }
        .foregroundColor(.white)
    }
}


// MARK: - Redacted Info View
struct RedactedInfoView: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 60, height: 4)
                    .foregroundColor(Color.white.opacity(0.4))
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 40, height: 4)
                    .foregroundColor(Color.white.opacity(0.4))
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 20, height: 4)
                    .foregroundColor(Color.white.opacity(0.4))
            }
            Spacer()
            VStack(alignment: .leading) {
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .foregroundColor(Color.white.opacity(0.4))
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 30, height: 4)
                    .foregroundColor(Color.white.opacity(0.4))
                RoundedRectangle(cornerRadius: 4)
                    .frame(width: 50, height: 4)
                    .foregroundColor(Color.white.opacity(0.4))
            }
        }
        HStack {
            RoundedRectangle(cornerRadius: 4)
                .frame(width: 90, height: 6)
                .foregroundColor(Color.white.opacity(0.5))
            Spacer()
        }
    }
}
