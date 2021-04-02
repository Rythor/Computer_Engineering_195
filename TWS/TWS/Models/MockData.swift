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
    // Quotes
    static let sampleQuotes     : [QuoteSummary]       = [QuoteSummary(client: "John Appleseed"),
                                                          QuoteSummary(client: "Jack Appleseed"),
                                                          QuoteSummary(client: "Joe Appleseed"),
                                                          QuoteSummary(client: "Jim Appleseed"),
                                                          QuoteSummary(client: "Tim Appleseed"),
                                                          QuoteSummary(client: "Someone Appleseed"),
                                                          QuoteSummary(client: "Whatever Appleseed")]
    
    // Windows
    static let sampleGasTypes   : [GlassType]   = [.lowE270, .lowE360, .obscured]
    static let sampleFrameTypes : [FrameType]   = [.blockFrame, .nailFin, .retrofit]
}
