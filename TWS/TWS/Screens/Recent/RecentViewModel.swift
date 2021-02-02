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
    @Published var isExpanded: Bool = true
    @Published var isShowingDetailView: Bool = false

    var selectedQuote: Quote?
    var selectedIndex: Int?
    
    var recentQuotes = MockData.sampleQuotes
    
    let columns = [GridItem(.flexible())]
}
