//
//  AlertView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/23/21.
//

import SwiftUI

///
/// A custom alert view. (moved to Toast)
///
struct AlertView: View {
    let item: AlertItem
    
    var body: some View {
        HStack(spacing: 25) {
            Image(systemName: item.image)
                .font(.title)
            item.message
                .font(.body)
                .multilineTextAlignment(.center)
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .frame(height: 50)
        .foregroundColor(.white)
        .background(item.imageColor.opacity(0.9))
        .cornerRadius(5)
    }
}

struct AlertView_Previews: PreviewProvider {
    static var previews: some View {
        AlertView(item: AlertContext.windowAdded)
    }
}


/*
 // vertical version
 var body: some View {
     VStack(spacing: 10) {
         Image(systemName: item.image)
             .font(.title)
         item.message
             .font(.body)
             .multilineTextAlignment(.center)
     }
     .padding()
     .frame(width: 140, height: 140)
     .foregroundColor(.white)
     .background(item.color.opacity(0.9))
     .cornerRadius(8)
 }
 */
/*
 // horizontal version
 var body: some View {
     HStack(spacing: 25) {
         Image(systemName: item.image)
             .font(.title)
         Text(item.message)
             .font(.body)
             .multilineTextAlignment(.center)
         Spacer()
     }
     .padding()
     .frame(maxWidth: .infinity)
     .frame(height: 50)
     .foregroundColor(.white)
     .background(item.color.opacity(0.9))
     .cornerRadius(5)
 }
 */
