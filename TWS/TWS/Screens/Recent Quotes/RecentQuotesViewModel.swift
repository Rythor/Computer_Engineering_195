//
//  RecentViewModel.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import SwiftUI

///
/// Handles all data logic for the recents quotes screen.
///
class RecentQuotesViewModel: ObservableObject {
    @Published var isShowingDetailView: Bool = false

    var selectedQuote: QuoteSummary?
    var selectedIndex: Int?
    
    var recents = MockData.sampleQuotes
    var filteredRecents = [QuoteSummary]()
    
    func filterRecents(by predicate: String) -> [QuoteSummary] {
        filteredRecents = recents.filter { $0.client.lowercased().contains(predicate) }
        return filteredRecents
    }
}
