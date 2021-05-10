//
//  SelectionView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/21/21.
//

import SwiftUI

struct SelectionView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var options                         : [String]
    @Binding var selectedIndex          : Int?
    
    var selectionText: String {
        if let index = selectedIndex {
            return options[index]
        } else {
            return "--"
        }
    }
    
    var body: some View {
        Picker(selection: $selectedIndex,
               label:
                VStack {
                    HStack {
                        Text(selectionText)
                            .font(.title3)
                            .foregroundColor(.white)
                        Spacer()
                        Image(systemName: "chevron.down")
                            .frame(width: 50, height: 50)
                            .foregroundColor(.white)
                            .animation(.spring())
                    }
                    .padding()
                }
                .frame(maxWidth: .infinity)
                .frame(height: 50)
                .background(colorScheme == .light ? Color.black : Color(UIColor.secondarySystemBackground))
                .cornerRadius(5)
               ){
            ForEach(options.indices, id: \.self) { index in
                Text("\(options[index])").tag(index as Int?)
            }
        }
        .pickerStyle(MenuPickerStyle())
    }
}

struct SelectionView_Previews: PreviewProvider {
    static var previews: some View {
        SelectionView(
            options: ["sample 1", "sample 2"],
            selectedIndex: .constant(0)
        )
    }
}
