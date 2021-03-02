//
//  SummaryView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/20/21.
//

import SwiftUI

///
/// The quote summary screen.
///
struct SummaryView: View {
    @EnvironmentObject var quote: Quote
    
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
            .navigationTitle("Summary")
        }
        .onAppear {
            AuthManager.shared.requestAuth()
        }
    }
}
