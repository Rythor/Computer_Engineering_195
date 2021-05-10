//
//  TWSTextField.swift
//  TWS
//
//  Created by Brian Tamsing on 2/21/21.
//

import SwiftUI

///
/// Custom, native SwiftUI text field.
///
/// Currently, unused, with "TWSTextField" being used.
///
struct TWSTextField2: View {
    let titleKey: String
    @Binding var text: String
    @State private var isEditing: Bool = false
    
    var body: some View {
        VStack(spacing: -1) {
            TextField(titleKey, text: $text, onEditingChanged: { isEditing in
                self.isEditing = isEditing
            })
                .frame(height: 65)
                .font(.title3)
                .accentColor(.twsBlue)
            Divider()
                .frame(height: 1)
                .background(isEditing ? .twsBlue : Color(UIColor.secondarySystemBackground))
        }
    }
}

struct TWSTextField_Previews: PreviewProvider {
    static var previews: some View {
        TWSTextField2(titleKey: "Sample", text: .constant(""))
    }
}
