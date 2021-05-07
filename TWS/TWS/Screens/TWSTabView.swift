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
                    Image(systemName: "house")
                    Text("Quote")
                }
            OrderView()
                .tabItem {
                    Image(systemName: "bag")
                    Text("Order")
                }
                .environmentObject(DownloadManager.shared)
            RecentQuotesView()
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
