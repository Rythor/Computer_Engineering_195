//
//  QuoteView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/14/21.
//

import SwiftUI

struct QuoteView: View {
    @StateObject var viewModel = QuoteViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    // Dimensions
                    VStack(spacing: -3) {
                        SectionHeader(header: "Dimensions")
                        TWSTextField(titleKey: "Width", text: $viewModel.window.width)
                            .keyboardType(.numbersAndPunctuation)
                        TWSTextField(titleKey: "Height", text: $viewModel.window.height)
                            .keyboardType(.numbersAndPunctuation)
                    }
                    
                    // Room
                    VStack(spacing: -3) {
                        SectionHeader(header: "Room")
                        TWSTextField(titleKey: "Label", text: $viewModel.window.label)
                            .autocapitalization(UITextAutocapitalizationType.words)
                    }
                    Spacer()
                }
                .padding(20)
            }
            .navigationTitle("Quote")
        }
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
    }
}

// MARK: - View Components
struct SectionHeader: View {
    let header: String
    var body: some View {
        HStack {
            Text(header)
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
            Spacer()
        }
    }
}

struct TWSTextField: View {
    let titleKey: String
    @Binding var text: String
    
    var body: some View {
        VStack(spacing: -1) {
            TextField(titleKey, text: $text)
                .frame(height: 60)
                .font(.system(size: 20, design: .default))
            Divider()
                .frame(height: 1)
        }
    }
}
