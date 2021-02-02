//
//  MockData.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import Foundation

///
/// Mock data to be used within views for testing purposes.
///
struct MockData {
    static let sampleQuotes: [Quote] = Array(repeating: Quote(client: "John Appleseed"), count: 8)
}
