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
final class NetworkManager {
    static let shared           = NetworkManager()
    let rpaEndpoint             = "https://platform.uipath.com/keithdyhebwn/KeithDefault/odata/Queues/UiPathODataSvc.AddQueueItem"
    
    private let tenantName      : StaticString  = "KeithDefault"
    
    private init() { }
    
    public func triggerRPA(accessToken: String) {
        guard let url = URL(string: rpaEndpoint) else { return }
        
        var request         = URLRequest(url: url)
        request.httpMethod  = "POST"
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("\(tenantName)", forHTTPHeaderField: "X-UIPATH-TenantName")
        
        var components          = URLComponents()
        components.queryItems   = [
            URLQueryItem(name: "", value: "")
        ]
        
        request.httpBody = components.percentEncodedQuery?.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            // ...
        }
        
        task.resume()
    }
    
    public func getQuote(_ quote: QuoteSummary, completionHandler: @escaping (Result<QuoteSummary, Error>) -> Void) {
        // ...
    }
}
