//
//  Quote.swift
//  TWS
//
//  Created by Brian Tamsing on 2/22/21.
//

import Foundation

///
/// Quote instance to be used within the environment.
///
class Quote: ObservableObject {
    @Published var windows = [Window]()
    
    func add(_ window: Window) {
        windows.append(window)
    }
}
