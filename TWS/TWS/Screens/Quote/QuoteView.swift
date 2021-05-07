//
//  QuoteView.swift
//  TWS
//
//  Created by Brian Tamsing on 2/14/21.
//

import SwiftUI

///
/// The quoting screen.
///
struct QuoteView: View {
    @EnvironmentObject var quote: Quote
    @StateObject var viewModel = QuoteViewModel()

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(spacing: 25) {
                    // Dimensions
                    VStack(spacing: 0) {
                        SectionHeader(text: "Dimensions")
                        HStack {
                            VStack(spacing: -1) {
                                TWSTextFieldRepresentable(placeholder: "Width",
                                              keyboardType: .numbersAndPunctuation,
                                              autoCapitalizationType: nil,
                                              text: $viewModel.window.width)
                                    .frame(height: 65)
                                Divider()
                                    .frame(height: 1)
                            }
                            VStack(spacing: -1) {
                                TWSTextFieldRepresentable(placeholder: "Height",
                                              keyboardType: .numbersAndPunctuation,
                                              autoCapitalizationType: nil,
                                              text: $viewModel.window.height)
                                    .frame(height: 65)
                                Divider()
                                    .frame(height: 1)
                            }
                        }
                    }
                    
                    // Room
                    VStack(spacing: 0) {
                        SectionHeader(text: "Room")
                        VStack(spacing: -1) {
                            TWSTextFieldRepresentable(placeholder: "Label",
                                          keyboardType: nil,
                                          autoCapitalizationType: .words,
                                          text: $viewModel.window.room)
                                .frame(height: 65)
                            Divider()
                                .frame(height: 1)
                        }
                    }
                    
                    // Type
                    VStack {
                        SectionHeader(text: "Opening")
                        SelectionView(options: viewModel.openingTypes,
                                      selectedIndex: $viewModel.openingTypeSelectedIndex)
                    }
                    
                    // Types associated with the above Opening Type
                    VStack {
                        SectionHeader(text: "Type")
                        SelectionView(options: viewModel.currentAssociatedTypes,
                                      selectedIndex: viewModel.getAssociatedSelectedIndexBasedOffOpeningType())
                    }
                    
                    Spacer()
                    
                    Button {
                        guard viewModel.isValidForm else { return }
                        
                        quote.add(viewModel.window)
                        viewModel.createNewWindow()
                    } label: {
                        TWSButton(text: "Add Window")
                    }
                }
                .padding(20)
                .navigationTitle("Quote")
            }
        }
        .onTapGesture {
            hideKeyboard()
        }
        .toast(isPresenting: $viewModel.isPresentingToast, alertItem: viewModel.alertItem)
    }
}

struct QuoteView_Previews: PreviewProvider {
    static var previews: some View {
        QuoteView()
            
    }
}
