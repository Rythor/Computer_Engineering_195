//
//  TWSButton.swift
//  TWS
//
//  Created by Brian Tamsing on 2/20/21.
//

import SwiftUI

struct TWSButton: View {
    let text: String
    
    var body: some View {
        VStack {
            Text(text)
                .foregroundColor(.white)
                .font(.title3)
                .fontWeight(.medium)
        }
        .frame(width: 280, height: 50)
        .background(Color.blue)
        .cornerRadius(5)
    }
}

struct TWSButton_Previews: PreviewProvider {
    static var previews: some View {
        TWSButton(text: "Some sample text")
    }
}
