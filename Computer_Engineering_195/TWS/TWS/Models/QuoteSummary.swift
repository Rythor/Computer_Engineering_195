//
//  Quote.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import Foundation

///
/// Represents a Quote instance.
///
/// note: not in the correct state, had to change to properly create the quoting screen.
///
struct QuoteSummary: Hashable, Identifiable {
    let id      = UUID()
    let client  : String
}
