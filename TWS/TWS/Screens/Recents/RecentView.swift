//
//  RecentView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import SwiftUI

///
/// The recent quotes screen.
///
struct RecentView: View {
    @StateObject var viewModel = RecentViewModel()
    
    var body: some View {
        ZStack {
            NavigationView {
                ScrollView {
                    LazyVGrid(columns: viewModel.columns) {
                        ForEach(viewModel.recentQuotes.indices) { index in
                            WavyQuoteCard(quote: viewModel.recentQuotes[index],
                                      color1: Gradients.gradients[index % Gradients.gradients.count][0],
                                      color2: Gradients.gradients[index % Gradients.gradients.count][1])
                            .padding(.top, 20)
                            .padding(.bottom, 20)
                            .onTapGesture {
                                viewModel.selectedQuote = viewModel.recentQuotes[index]
                                viewModel.selectedIndex = index
                                
                                viewModel.isShowingDetailView = true
                            }
                        }
                    }
                    .padding(.horizontal)
                    .animation(.easeInOut(duration: 0.8))
                }
                .navigationTitle("Recent")
                .sheet(isPresented: $viewModel.isShowingDetailView) {
                    QuoteDetailView(quote: viewModel.selectedQuote!,
                                    quoteIndex: viewModel.selectedIndex!,
                                    isShowingDetailView: $viewModel.isShowingDetailView)
                }
            }
        }
    }
}


struct RecentView_Previews: PreviewProvider {
    static var previews: some View {
        RecentView()
    }
}
