//
//  BackArrow.swift
//  TWS
//
//  Created by Brian Tamsing on 2/14/21.
//

import SwiftUI

struct BackArrow: View {
    var body: some View {
        Image(systemName: "chevron.backward")
            .font(.system(size: 22))
            .foregroundColor(Color(.label))
            .frame(width: 35, height: 35)
            .background(Color(UIColor.secondarySystemBackground).opacity(0.9))
            .mask(Circle())
    }
}

struct BackArrow_Previews: PreviewProvider {
    static var previews: some View {
        BackArrow()
    }
}
