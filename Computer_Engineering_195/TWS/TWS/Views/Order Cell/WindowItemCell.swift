//
//  WindowItemCell.swift
//  TWS
//
//  Created by Brandon Cheu on 3/14/21.
//

import SwiftUI

struct WindowItemCell: View {
    let window: Window
    let index: Int
    
    var body: some View {
        HStack(spacing: 5) {
            // item number
            VStack {
                Text("\(index)")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
            .frame(width: 35, alignment: .leading)
            
            // window properties
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text(window.openingType.rawValue)
                        .font(.title3)
                        .fontWeight(.semibold)
                        .frame(maxWidth: .infinity,
                               alignment: .leading)
                }
                HStack {
                    InfoBox(title: "Width", text: "\(window.width)")
                    InfoBox(title: "Height", text: "\(window.height)")
                    InfoBox(title: "Qty", text: "\(window.quantity)")
                }
            }
        }
        .foregroundColor(.primary)
    }
}

struct WindowItemCell_Previews: PreviewProvider {
    static var previews: some View {
        WindowItemCell(window: Window(width: "55",
                                      height: "65",
                                      room: "Living Room",
                                      openingType: .window,
                                      quantity: "1"),
                       index: 1)
    }
}

struct InfoBox: View {
    let title: String
    let text: String
    
    var body: some View {
        Text("\(title): \(text)")
            .font(.caption)
            .foregroundColor(.secondary)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
}
