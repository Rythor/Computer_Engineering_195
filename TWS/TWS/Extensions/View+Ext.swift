//
//  View+Ext.swift
//  TWS
//
//  Created by Brian Tamsing on 3/25/21.
//

import SwiftUI

extension View {
    #if canImport(UIKit)
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
    #endif
    
    func toast(isPresenting: Binding<Bool>, alertItem: AlertItem) -> some View {
        return
            Toast(
                isPresenting: isPresenting,
                presentingView: { self },
                item: alertItem
            )
    }
}
