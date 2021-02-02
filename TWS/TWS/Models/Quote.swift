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
struct Quote: Hashable, Identifiable {
    let id      = UUID()
    let client  : String
}
