//
//  NetworkManager.swift
//  TWS
//
//  Created by Brian Tamsing on 2/3/21.
//

import Foundation

///
/// A Singleton which manages network calls to the UiPath RPA and related API.
///
class NetworkManager {
    static let shared       = NetworkManager()
    let baseEndpoint        = "...tbd"
    
    private init() { }
    
    public func getQuote(_ quote: QuoteSummary, completionHandler: @escaping (Result<QuoteSummary, Error>) -> Void) {
        // ...
    }
}
