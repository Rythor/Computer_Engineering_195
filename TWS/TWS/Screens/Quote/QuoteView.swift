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
    @StateObject var viewModel  = QuoteViewModel()
    
    var body: some View {
        NavigationView {
            ZStack {
                ScrollView {
                    VStack(spacing: 25) {
                        // Dimensions
                        VStack(spacing: 0) {
                            SectionHeader(header: "Dimensions")
                            TWSTextField(titleKey: "Width", text: $viewModel.window.width)
                                .keyboardType(.numbersAndPunctuation)
                            TWSTextField(titleKey: "Height", text: $viewModel.window.height)
                                .keyboardType(.numbersAndPunctuation)
                        }
                        
                        // Room
                        VStack(spacing: 0) {
                            SectionHeader(header: "Room")
                            TWSTextField(titleKey: "Label", text: $viewModel.window.label)
                                .autocapitalization(UITextAutocapitalizationType.words)
                        }
                        
                        // Window Type
                        VStack {
                            SectionHeader(header: "Window Type")
                            SelectionView(options: viewModel.windowTypes,
                                          selectedIndex: $viewModel.windowTypeSelectedIndex,
                                          isShowingPicker: $viewModel.isShowingWindowTypePicker,
                                          hasPickerOpen: $viewModel.hasPickerOpen)
                        }
                        
                        
                        // Casement Type
                        VStack {
                            SectionHeader(header: "Casement Type")
                            SelectionView(options: viewModel.casementTypes,
                                          selectedIndex: $viewModel.casementTypeSelectedIndex,
                                          isShowingPicker: $viewModel.isShowingCasementTypePicker,
                                          hasPickerOpen: $viewModel.hasPickerOpen)
                        }
                        
                        // Glass Type
                        VStack {
                            SectionHeader(header: "Glass Type")
                            SelectionView(options: viewModel.glassTypes,
                                          selectedIndex: $viewModel.glassTypeSelectedIndex,
                                          isShowingPicker: $viewModel.isShowingGlassTypePicker,
                                          hasPickerOpen: $viewModel.hasPickerOpen)
                        }
                        
                        // Gas Type
                        VStack {
                            SectionHeader(header: "Gas Type")
                            SelectionView(options: viewModel.gasTypes,
                                          selectedIndex: $viewModel.gasTypeSelectedIndex,
                                          isShowingPicker: $viewModel.isShowingGasTypePicker,
                                          hasPickerOpen: $viewModel.hasPickerOpen)
                        }
                        
                        // Tempered Type
                        VStack {
                            SectionHeader(header: "Tempered Type")
                            SelectionView(options: viewModel.temperedTypes,
                                          selectedIndex: $viewModel.temperedTypeSelectedIndex,
                                          isShowingPicker: $viewModel.isShowingTemperedTypePicker,
                                          hasPickerOpen: $viewModel.hasPickerOpen)
                        }
                        
                        // Frame Type
                        VStack {
                            SectionHeader(header: "Frame Type")
                            SelectionView(options: viewModel.frameTypes,
                                          selectedIndex: $viewModel.frameTypeSelectedIndex,
                                          isShowingPicker: $viewModel.isShowingFrameTypePicker,
                                          hasPickerOpen: $viewModel.hasPickerOpen)
                        }
                        
                        Button {
                            quote.add(viewModel.window)
                            viewModel.window = Window() // not fully complete yet. the window instance is reset and so are the fields, but the pickers are not
                        } label: {
                            TWSButton(text: "Add Window")
                        }
                    }
                    .padding(20)
                }
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
