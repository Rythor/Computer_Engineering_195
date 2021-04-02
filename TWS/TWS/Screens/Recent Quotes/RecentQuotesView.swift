//
//  RecentQuotesView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import SwiftUI

///
/// The recent quotes screen.
///
struct RecentQuotesView: View {
    @StateObject var viewModel                      = RecentQuotesViewModel()
    @ObservedObject var searchControllerProvider    = UISearchControllerProvider(placeholder: nil)
    
    var body: some View {
        ZStack {
            NavigationView {
                List(
                    searchControllerProvider.isSearching ?
                        viewModel.filterRecents(by: searchControllerProvider.text).indices :
                        viewModel.recents.indices,
                     id: \.self
                ){ index in
                    QuoteCard(quote:
                                searchControllerProvider.isSearching ?
                                viewModel.filteredRecents[index] :
                                viewModel.recents[index],
                                  color1: Gradients.gradients[index % Gradients.gradients.count][0],
                                  color2: Gradients.gradients[index % Gradients.gradients.count][1])
                        .padding(.top, 20)
                        .padding(.bottom, 20)
                        .onTapGesture {
                            viewModel.selectedQuote = viewModel.recents[index]
                            viewModel.selectedIndex = index
                            
                            viewModel.isShowingDetailView = true
                        }
                }
                .navigationTitle("Recent")
                .overlay(
                    ParentViewControllerResolver { viewController in
                    viewController.navigationItem.searchController = self.searchControllerProvider.searchController
                    }
                    .frame(width: 0, height: 0)
                )
                .listStyle(PlainListStyle())
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
        RecentQuotesView()
    }
}
// a search bar controller
/*
 .overlay(ParentViewControllerResolver { viewController in
     viewController.navigationItem.searchController = self.searchControllerProvider.searchController
 })
     .frame(width: 0, height: 0)
 */

// original list view
/*
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
 */
