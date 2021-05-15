//
//  OrderViewModel.swift
//  TWS
//
//  Created by Brian Tamsing on 2/20/21.
//

import SwiftUI

class OrderViewModel: ObservableObject {
    // MARK: - Properties
    @Published var isLoading: Bool = false
    
    // MARK: - Methods
    public func runQuote(for windows: [Window]) {
        withAnimation { isLoading = true }
        AuthManager.shared.requestAuth { accessToken in
            NetworkManager.shared.triggerRPA(for: windows, using: accessToken) {
                DispatchQueue.main.async {
                    withAnimation { self.isLoading = false }
                }
                DownloadManager.shared.getQuote()
            }
        }
    }
    
    public func downloadQuote(using manager: DownloadManager) {
        manager.getQuote()
    }
}
