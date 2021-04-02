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
    @Published var alertItem = AlertContext.none
    @Published var isPresentingToast: Bool = false
    
    // window type
    @Published var windowTypeSelectedIndex          : Int       = 0 {
        didSet {
            self.window.type            = WindowType.allCases[windowTypeSelectedIndex]
        }
    }
    let windowTypes                                 : [String]  = WindowType.allCases.map { $0.rawValue }
    
    
    // casement  type
    @Published var casementTypeSelectedIndex        : Int       = 0 {
        didSet {
            self.window.casementSideType    = CasementSideType.allCases[casementTypeSelectedIndex]
        }
    }
    let casementTypes                               : [String]  = CasementSideType.allCases.map { $0.rawValue }
    
    
    // glass type
    @Published var glassTypeSelectedIndex           : Int       = 0 {
        didSet {
            self.window.glassType           = GlassType.allCases[glassTypeSelectedIndex]
        }
    }
    let glassTypes                                  : [String]  = GlassType.allCases.map { $0.rawValue }
    
    
    // gas type
    @Published var gasTypeSelectedIndex             : Int       = 0 {
        didSet {
            self.window.gasType             = GasType.allCases[gasTypeSelectedIndex]
        }
    }
    let gasTypes                                    : [String]  = GasType.allCases.map { $0.rawValue }
    
    
    // tempered type
    @Published var temperedTypeSelectedIndex        : Int       = 0 {
        didSet  {
            self.window.temperedType        = TemperedType.allCases[temperedTypeSelectedIndex]
        }
    }
    let temperedTypes                               : [String]  = TemperedType.allCases.map { $0.rawValue }
    
    
    // frame type
    @Published var frameTypeSelectedIndex           : Int       = 0 {
        didSet {
            self.window.frameType           = FrameType.allCases[frameTypeSelectedIndex]
        }
    }
    let frameTypes                                  : [String]  = FrameType.allCases.map { $0.rawValue }
    
    var isValidForm: Bool {
        guard window.width != "",
              window.height != "",
              window.label != "",
              isValidNumber(window.width),
              isValidNumber(window.height)
        else {
            alertItem = AlertContext.invalidForm
            animateToast()
            
            return false
        }
        
        alertItem = AlertContext.windowAdded
        animateToast()
        
        return true
    }
    
    func createNewWindow() {
        self.window = Window()
        windowTypeSelectedIndex = 0
        casementTypeSelectedIndex = 0
        glassTypeSelectedIndex = 0
        gasTypeSelectedIndex = 0
        temperedTypeSelectedIndex = 0
        frameTypeSelectedIndex = 0
    }
    
    func isValidNumber(_ number: String) -> Bool {
        // a lil sketchy
        let regex = try! NSRegularExpression(pattern: "[^0-9/ ]+")
        let range = NSRange(location: 0, length: number.utf16.count)
        
        if regex.firstMatch(in: number, options: [], range: range) != nil {
            return false
        } else {
            return true
        }
    }
    
    func animateToast() {
        withAnimation {
            self.isPresentingToast = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 1.25) {
                withAnimation {
                    self.isPresentingToast = false
                }
            }
        }
    }
}
