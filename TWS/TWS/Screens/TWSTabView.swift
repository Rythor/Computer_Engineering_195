//
//  TWSTabView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/2/21.
//

import SwiftUI

///
/// Represents the entire application's tab view.
///
struct TWSTabView: View {
    var body: some View {
        TabView {
            RecentView()
                .tabItem {
                    Image(systemName: "mail.stack")
                    Text("Recent")
                }
        }
        .accentColor(.primary)
    }
}


struct TWSTabView_Previews: PreviewProvider {
    static var previews: some View {
        TWSTabView()
    }
}
