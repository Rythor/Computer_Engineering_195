//
//  NetworkManager.swift
//  TWS
//
//  Created by Brian Tamsing on 2/3/21.
//

import Foundation

///
/// A Singleton which manages network calls to the UiPath RPA and TWS API.
///
final class NetworkManager {
    // MARK: - Properties
    static let shared           = NetworkManager()
    
    let rpaEndpoint             = "https://platform.uipath.com/keithdyhebwn/KeithDefault/odata/Queues/UiPathODataSvc.AddQueueItem"
    private let tenantName      : StaticString  = "KeithDefault"
    
    
    // MARK: - Init
    private init() { }
    
    
    // MARK: - Methods
    public func triggerRPA(for windows: [Window],
                           using accessToken: String,
                           completionHandler: @escaping () -> Void
    ){
        guard let url = URL(string: rpaEndpoint) else { return }

        var request = URLRequest(url: url)
        // --- HEADER CONFIG ---
        request.httpMethod  = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("Bearer \(accessToken)", forHTTPHeaderField: "Authorization")
        request.setValue("\(tenantName)", forHTTPHeaderField: "X-UIPATH-TenantName")
        
        // --- BODY CONFIG ---
        var rpaRequest: [String: Any]
        var windowInstances = [[String:String]]() // -> will be an array of each window object serialized into json
        do {
            for window in windows {
                windowInstances.append(try window.getDictionaryRepresentation())
            }
            
            // -> serialize the above array into json, so that we can obtain it as a string (per the request requirements)
            let instancesData = try JSONSerialization.data(withJSONObject: windowInstances, options: [.sortedKeys, .withoutEscapingSlashes])
            
            // because of the request's nested structure, we also have to replace all double quotes with single quotes in each of the window objects / dictionaries
            var responseValue = String(decoding: instancesData, as: UTF8.self).replacingOccurrences(of: "\"", with: "'")
            
            // matches everything in-between whitespaces and then removes it
            responseValue = responseValue.replacingOccurrences(of: "\\s[0-9]+\\s", with: "", options: .regularExpression)
            
            rpaRequest = [
                "itemData": [
                    "Name": "PricingQueue",
                    "SpecificContent": [
                        "response": responseValue
                    ]
                ]
            ]
            
            // setting the value for the rpaRequest's "response" key still adds unnecessary escape characters, so we need to remove those as well
            let data = try JSONSerialization.data(withJSONObject: rpaRequest, options: [])
            guard let payload = String(decoding: data, as: UTF8.self).replacingOccurrences(of: "\\", with: "").data(using: .utf8) else {
                print("failed to initialize the payload")
                return
            }
            
            // payload init successful, set
            request.httpBody = payload
            
        } catch { print(error) }
        
        // --- NETWORK CALL ---
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error { print(error); return }
            
            guard let response = response as? HTTPURLResponse, (200...299).contains(response.statusCode) else { print("bad reponse"); return }
            
            guard data != nil else { print("bad data"); return }
            
            print("status code: \(response.statusCode)")
            // for now, just print
            print("rpa successfully triggered")
            
            completionHandler()
        }
        
        task.resume()
    }
}
