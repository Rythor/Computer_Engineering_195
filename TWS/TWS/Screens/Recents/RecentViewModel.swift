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
class RecentViewModel: ObservableObject {
    @Published var isShowingDetailView: Bool = false

    var selectedQuote: QuoteSummary?
    var selectedIndex: Int?
    
    var recentQuotes = MockData.sampleQuotes
    
    let columns = [GridItem(.flexible())]
}
