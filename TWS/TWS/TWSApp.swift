//
//  TWSApp.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import SwiftUI

@main
struct TWSApp: App {
    var body: some Scene {
        WindowGroup {
            TWSTabView()
                .environmentObject(DownloadManager.shared)
        }
    }
}
