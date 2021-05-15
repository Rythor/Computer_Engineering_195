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
    @EnvironmentObject var downloadManager: DownloadManager
    
    var body: some View {
        ZStack {
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
                RecentQuotesView()
                    .tabItem {
                        Image(systemName: "mail.stack")
                        Text("Recent")
                    }
            }
            .accentColor(.primary)
            .environmentObject(quote)
            
            if downloadManager.isRequestingQuote {
                LoadingView(description: "Please wait while the automation completes your quote.")
            }
            
            if downloadManager.isDownloading {
                DownloadProgressView(downloadProgress: $downloadManager.downloadProgress)
            }
        }
    }
}


struct TWSTabView_Previews: PreviewProvider {
    static var previews: some View {
        TWSTabView()
    }
}
