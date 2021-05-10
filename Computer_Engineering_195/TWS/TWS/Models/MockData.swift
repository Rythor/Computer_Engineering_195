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
    static let sampleQuotes: [QuoteSummary] = [QuoteSummary(client: "John Appleseed"),
                                               QuoteSummary(client: "Jack Appleseed"),
                                               QuoteSummary(client: "Joe Appleseed"),
                                               QuoteSummary(client: "Jim Appleseed"),
                                               QuoteSummary(client: "Tim Appleseed"),
                                               QuoteSummary(client: "Someone Appleseed"),
                                               QuoteSummary(client: "Whatever Appleseed")]
}
