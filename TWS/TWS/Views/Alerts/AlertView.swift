//
//  AlertView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/23/21.
//

import SwiftUI

struct AlertView: View {
    let item: AlertItem
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: item.image)
                .font(.title)
            Text(item.message)
                .font(.body)
                .multilineTextAlignment(.center)
        }
        .padding()
        .frame(width: 140, height: 140)
        .foregroundColor(.white)
        .background(item.color.opacity(0.9))
        .cornerRadius(10)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(item: AlertContext.invalidForm)
    }
}
