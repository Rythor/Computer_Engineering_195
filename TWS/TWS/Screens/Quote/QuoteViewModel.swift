//
//  QuoteViewModel.swift
//  TWS
//
//  Created by Brian Tamsing on 2/14/21.
//

import SwiftUI

class QuoteViewModel: ObservableObject {
    // MARK: - Properties
    @Published var window = Window()
    @Published var alertItem: AlertItem?
    
    // window type
    @Published var windowTypeSelectedIndex          : Int       = 0 {
        didSet {
            self.window.type            = WindowType.allCases[windowTypeSelectedIndex]
            isShowingWindowTypePicker   = false
            hasPickerOpen               = false
        }
    }
    let windowTypes                                 : [String]  = WindowType.allCases.map { $0.rawValue }
    
    
    // casement  type
    @Published var casementTypeSelectedIndex        : Int       = 0 {
        didSet {
            self.window.casementSideType    = CasementSideType.allCases[casementTypeSelectedIndex]
            isShowingCasementTypePicker     = false
            hasPickerOpen                   = false
        }
    }
    let casementTypes                               : [String]  = CasementSideType.allCases.map { $0.rawValue }
    
    
    // glass type
    @Published var glassTypeSelectedIndex           : Int       = 0 {
        didSet {
            self.window.glassType           = GlassType.allCases[glassTypeSelectedIndex]
            isShowingGlassTypePicker        = false
            hasPickerOpen                   = false
        }
    }
    let glassTypes                                  : [String]  = GlassType.allCases.map { $0.rawValue }
    
    
    // gas type
    @Published var gasTypeSelectedIndex             : Int       = 0 {
        didSet {
            self.window.gasType             = GasType.allCases[gasTypeSelectedIndex]
            isShowingGasTypePicker          = false
            hasPickerOpen                   = false
        }
    }
    let gasTypes                                    : [String]  = GasType.allCases.map { $0.rawValue }
    
    
    // tempered type
    @Published var temperedTypeSelectedIndex        : Int       = 0 {
        didSet  {
            self.window.temperedType        = TemperedType.allCases[temperedTypeSelectedIndex]
            isShowingTemperedTypePicker     = false
            hasPickerOpen                   = false
        }
    }
    let temperedTypes                               : [String]  = TemperedType.allCases.map { $0.rawValue }
    
    
    // frame type
    @Published var frameTypeSelectedIndex           : Int       = 0 {
        didSet {
            self.window.frameType           = FrameType.allCases[frameTypeSelectedIndex]
            isShowingFrameTypePicker        = false
            hasPickerOpen                   = false
        }
    }
    let frameTypes                                  : [String]  = FrameType.allCases.map { $0.rawValue }
    
    var isValidForm: Bool {
        self.alertItem = AlertContext.invalidForm
        return false
    }
    
    
    // MARK: - Methods
    
    
    // MARK: - Currently, Unused
    @Published var hasPickerOpen                    : Bool      = false
    @Published var isShowingWindowTypePicker        : Bool      = false
    @Published var isShowingCasementTypePicker      : Bool      = false
    @Published var isShowingGlassTypePicker         : Bool      = false
    @Published var isShowingGasTypePicker           : Bool      = false
    @Published var isShowingTemperedTypePicker      : Bool      = false
    @Published var isShowingFrameTypePicker         : Bool      = false
    
    func closePickers() {
        hasPickerOpen               = false
        isShowingWindowTypePicker   = false
        isShowingCasementTypePicker = false
        isShowingGlassTypePicker    = false
        isShowingGasTypePicker      = false
        isShowingTemperedTypePicker = false
        isShowingFrameTypePicker    = false
    }
}
