//
//  OrderView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/20/21.
//

import SwiftUI

///
/// The quote ordering "i.e., shopping cart" screen.
///
struct OrderView: View {
    @EnvironmentObject var quote            : Quote
    @EnvironmentObject var downloadManager  : DownloadManager
    
    @StateObject var viewModel              = OrderViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    List(quote.windows.indices, id: \.self) { index in
                        WindowItemCell(window: quote.windows[index], index: index + 1)
                    }
                    .listStyle(PlainListStyle())
                    
                    Button { // testing
                        //viewModel.getQuote(for: quote.windows)
                        //viewModel.downloadQuote(using: downloadManager)
                    } label: {
                        TWSButton(text: "Get Quote")
                    }
                    .padding(.bottom, 20)
                }
                .navigationTitle("Order")
                .sheet(isPresented: $downloadManager.isPreviewing) {
                    FilePreviewView(filePath: downloadManager.pathToDownloadedFile,
                                    isPreviewing: $downloadManager.isPreviewing)
                }
                
                /*
                if isPreviewing {
                    FilePreviewView(fileURL: file!)
                }
                 */
            }
            .blur(radius: viewModel.isLoading || downloadManager.isDownloading ? 1 : 0)
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            if downloadManager.isDownloading {
                DownloadProgressView(downloadProgress: $downloadManager.downloadProgress)
            }
        }
    }
}
