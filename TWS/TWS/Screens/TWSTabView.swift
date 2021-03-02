//
//  TWSTabView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import SwiftUI

///
/// Represents the entire application's tab view.
///
struct TWSTabView: View {
    var quote = Quote()
    
    var body: some View {
        TabView {
            QuoteView()
                .tabItem {
                    Image(systemName: "pencil.slash")
                    Text("Quote")
                }
            SummaryView()
                .tabItem {
                    Image(systemName: "cart")
                    Text("Summary")
                }
            RecentView()
                .tabItem {
                    Image(systemName: "mail.stack")
                    Text("Recent")
                }
        }
        .accentColor(.primary)
        .environmentObject(quote)
    }
}


struct TWSTabView_Previews: PreviewProvider {
    static var previews: some View {
        TWSTabView()
    }
}
