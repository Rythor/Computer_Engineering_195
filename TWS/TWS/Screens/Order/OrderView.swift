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
    @EnvironmentObject var quote    : Quote
    @State private var isExpanded   : Bool = false
    
    var body: some View {
        NavigationView {
            VStack {
                List(
                    quote.windows.indices,
                    id: \.self
                ){ index in
                    WindowItemCell(window: quote.windows[index], index: index + 1)
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
