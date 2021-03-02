//
//  AlertItem.swift
//  TWS
//
//  Created by Brian Tamsing on 2/23/21.
//

import SwiftUI

struct AlertItem {
    let message : String
    let image   : String
    let color   : Color
}

struct AlertContext {
    static let windowAdded  = AlertItem(message: "Added", image: "checkmark", color: .black)
    static let invalidForm  = AlertItem(message: "Invalid Form", image: "exclamationmark.circle", color: .red)
}
