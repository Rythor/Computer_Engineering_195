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
    static let sampleQuotes     : [Quote]       = Array(repeating: Quote(client: "John Appleseed"), count: 8)
    
    // Windows
    static let sampleGasTypes   : [GlassType]   = [.lowE270, .lowE360, .obscured]
    static let sampleFrameTypes : [FrameType]   = [.blockFrame, .nailFin, .retrofit]
}
