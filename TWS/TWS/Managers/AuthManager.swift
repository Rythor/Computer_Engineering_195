//
//  AuthManager.swift
//  TWS
//
//  Created by Brian Tamsing on 2/28/21.
//

import Foundation

///
/// A Singleton which manages authorization through UiPath.
///
final class AuthManager {
    // MARK: - Properties
    static let shared           = AuthManager()
    let baseEndpoint            = "https://account.uipath.com/oauth/token"
    
    private let grantType       : StaticString  = "refresh_token"
    private let clientID        : StaticString  = "8DEv1AMNXczW3y4U15LL3jYf62jK93n5"
    private let userKey         : StaticString  = "3FLWmXoKSb95uPNu60X4KEFZIOxNHee-apJ2ltsLaD64D"
    
    private let tenantName      : StaticString  = "KeithDefault"
    
    private var accessToken     : String? // valid for only 24 hours! regenerate using the userKey

    
    // MARK: - Init
    private init() { }
    
    
    // MARK: - Methods
    ///
    /// Requests authorization from the UiPath Automation Cloud.
    ///
    public func requestAuth() {
        guard let url = URL(string: baseEndpoint) else { return }
        
        var request         = URLRequest(url: url)
        request.httpMethod  = "POST"
        request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
        request.setValue("\(tenantName)", forHTTPHeaderField: "X-UIPATH-TenantName")
        
        var components          = URLComponents()
        components.queryItems   = [
            URLQueryItem(name: "grant_type", value: "\(grantType)"),
            URLQueryItem(name: "client_id", value: "\(clientID)"),
            URLQueryItem(name: "refresh_token", value: "\(userKey)")
        ]
        request.httpBody = components.percentEncodedQuery?.data(using: .utf8)
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, response, error in
            guard let self = self else { return }
            
            /* sufficient error handling for now */
            if let error = error {
                print(error)
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                print("bad response")
                return
            }
            
            guard let data = data else {
                print("bad data")
                return
            }
            
            do {
                let jsonObject = try JSONSerialization.jsonObject(with: data, options: .allowFragments)
                // now decode the json
                if let json = jsonObject as? [String: Any] {
                    if let accessToken = json["access_token"] as? String {
                        self.accessToken = accessToken
                    } else {
                        print("could not find any access token")
                    }
                }
            } catch {
                print(error)
            }
        }
        task.resume()
    }
    
    public func getAccessToken() -> String? {
        return self.accessToken
    }
}
