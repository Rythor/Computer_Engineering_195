//
//  SectionHeader.swift
//  TWS
//
//  Created by Brian Tamsing on 2/21/21.
//

import SwiftUI

struct SectionHeader: View {
    let text: String
    var body: some View {
        HStack {
            Text(text)
                .font(.title2)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            Spacer()
        }
    }
}

struct SectionHeader_Previews: PreviewProvider {
    static var previews: some View {
        SectionHeader(text: "Sample")
    }
}
