//
//  OrderView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/20/21.
//

import SwiftUI

///
/// The quote "shopping cart" screen.
///
struct OrderView: View {
    @EnvironmentObject var quote: Quote
    
    @State private var isExpanded: Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(quote.windows) { window in
                        // just temporary for testing purposes...
                        Text(window.label)
                    }
                }
                .listStyle(PlainListStyle())
            }
            .navigationTitle("Order")
        }
        .onAppear {
            AuthManager.shared.requestAuth()
        }
    }
}
