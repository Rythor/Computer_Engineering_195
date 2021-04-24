//
//  QuoteViewModel.swift
//  TWS
//
//  Created by Brian Tamsing on 2/14/21.
//

import SwiftUI

class QuoteViewModel: ObservableObject {
    // MARK: - Properties
    
    @Published var window                       = Window()
    @Published var alertItem                    = AlertContext.none
    @Published var isPresentingToast    : Bool  = false
    @Published var didSelectOpeningType : Bool  = false
    
    @Published var noOpeningTypeSelectedIndex       : Int!      = 0
    
    @Published var openingTypeSelectedIndex         : Int!      = 0 {
        didSet {
            self.window.openingType                             = OpeningType.allCases[openingTypeSelectedIndex!]
            setCurrentAssociatedTypes()
            nilAssociatedTypesSelectedIndices()
        }
    }
    let openingTypes                                : [String]  = OpeningType.allCases.map { $0.rawValue }
    
    
    @Published var windowTypeSelectedIndex          : Int?      {
        didSet {
            if let index = windowTypeSelectedIndex {
                self.window.windowType                          = WindowType.allCases[index]
            } else { self.window.windowType = nil }
        }
    }
    let windowTypes                                 : [String]  = WindowType.allCases.map { $0.rawValue }
    
    
    @Published var windowInsertTypeSelectedIndex    : Int?      {
        didSet {
            if let index = windowInsertTypeSelectedIndex {
                self.window.windowInsertType                     = WindowInsertType.allCases[index]
            } else { self.window.windowInsertType = nil }
        }
    }
    let windowInsertTypes                           : [String]  = WindowInsertType.allCases.map { $0.rawValue }
    
    
    @Published var slidingDoorTypeSelectedIndex     : Int?       {
        didSet {
            if let index = slidingDoorTypeSelectedIndex {
                self.window.slidingDoorType                      = SlidingDoorType.allCases[index]
            } else { self.window.slidingDoorType = nil }
        }
    }
    let slidingDoorTypes                            : [String]  = SlidingDoorType.allCases.map { $0.rawValue }
    
    
    @Published var hingedDoorTypeSelectedIndex      : Int?       {
        didSet {
            if let index = hingedDoorTypeSelectedIndex {
                self.window.hingedDoorType                       = HingedDoorType.allCases[index]
            } else { self.window.hingedDoorType = nil }
        }
    }
    let hingedDoorTypes                             : [String]  = HingedDoorType.allCases.map { $0.rawValue }
    
    
    @Published var currentAssociatedTypes           : [String]  = ["--"]
    
    var isValidForm: Bool {
        guard window.width != "",
              window.height != "",
              window.label != "",
              isValidNumber(window.width),
              isValidNumber(window.height),
              window.openingType != .noSelection,
              isAssociatedTypeSelected()
        else {
            alertItem = AlertContext.invalidForm
            animateToast()
            
            return false
        }
        
        alertItem = AlertContext.windowAdded
        animateToast()
        
        return true
    }
    
    
    // MARK: - Methods
    
    func setCurrentAssociatedTypes() {
        switch window.openingType {
            case .noSelection:
                currentAssociatedTypes = ["--"]
            case .window:
                currentAssociatedTypes = windowTypes
            case .windowInsert:
                currentAssociatedTypes = windowInsertTypes
            case .slidingDoor:
                currentAssociatedTypes = slidingDoorTypes
            case .hingedDoor:
                currentAssociatedTypes = hingedDoorTypes
        }
    }
    
    func isAssociatedTypeSelected() -> Bool {
        switch window.openingType {
        case .noSelection:
            return false
        case .window:
            if window.windowType == nil {
                return false
            } else { return true }
        case .windowInsert:
            if window.windowInsertType == nil {
                return false
            } else { return true }
        case .slidingDoor:
            if window.slidingDoorType == nil {
                return false
            } else { return true }
        case .hingedDoor:
            if window.hingedDoorType == nil {
                return false
            } else { return true }
        }
    }
    
    
    func getAssociatedSelectedIndexBasedOffOpeningType() -> Binding<Int?> {
        switch window.openingType {
            case .noSelection:
                return Binding(
                    get: {
                        self.noOpeningTypeSelectedIndex
                    },
                    set: {
                        self.noOpeningTypeSelectedIndex = $0
                    }
                )
            case .window:
                return Binding(
                    get: {
                        self.windowTypeSelectedIndex
                    },
                    set: {
                        self.windowTypeSelectedIndex = $0
                    }
                )
            case .windowInsert:
                return Binding(
                    get: {
                        self.windowInsertTypeSelectedIndex
                    },
                    set: {
                        self.windowInsertTypeSelectedIndex = $0
                    }
                )
            case .slidingDoor:
                return Binding(
                    get: {
                        self.slidingDoorTypeSelectedIndex
                    },
                    set: {
                        self.slidingDoorTypeSelectedIndex = $0
                    }
                )
            case .hingedDoor:
                return Binding(
                    get: {
                        self.hingedDoorTypeSelectedIndex
                    },
                    set: {
                        self.hingedDoorTypeSelectedIndex = $0
                    }
                )
        }
    }
    
    
    func createNewWindow() {
        self.window                     = Window()
        openingTypeSelectedIndex        = 0
        nilAssociatedTypesSelectedIndices()
    }
    
    
    func nilAssociatedTypesSelectedIndices() {
        windowTypeSelectedIndex         = nil
        windowInsertTypeSelectedIndex   = nil
        slidingDoorTypeSelectedIndex    = nil
        hingedDoorTypeSelectedIndex     = nil
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
