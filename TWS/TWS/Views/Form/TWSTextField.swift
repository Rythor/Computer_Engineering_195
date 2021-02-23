//
//  TWSTextField.swift
//  TWS
//
//  Created by Brian Tamsing on 2/21/21.
//

import SwiftUI

struct TWSTextField: View {
    let titleKey: String
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: -1) {
            TextField(titleKey, text: $text)
                .frame(height: 60)
                .font(.title3)
            Divider()
                .frame(height: 1)
        }
    }
}

struct TWSTextField_Previews: PreviewProvider {
    static var previews: some View {
        TWSTextField(titleKey: "Sample", text: .constant(""))
    }
}
