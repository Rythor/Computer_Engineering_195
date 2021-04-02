//
//  AlertItem.swift
//  TWS
//
//  Created by Brian Tamsing on 2/23/21.
//

import SwiftUI

struct AlertItem {
    let title       : Text
    let message     : Text
    let image       : String
    let imageColor  : Color
}

struct AlertContext {
    static let none         = AlertItem(title: Text(""),
                                        message: Text(""),
                                        image: "questionmark", imageColor: .blue)
    
    static let windowAdded  = AlertItem(title: Text("Success!"),
                                        message: Text("Window added"),
                                        image: "checkmark", imageColor: .twsBlue)
    
    static let invalidForm  = AlertItem(title: Text("Invalid Form"),
                                        message: Text("Invalid form"),
                                        image: "exclamationmark.circle", imageColor: .red)
}
