//
//  Window.swift
//  TWS
//
//  Created by Brian Tamsing on 2/14/21.
//

import Foundation

///
/// Represents a Window instance.
///
struct Window: Hashable, Encodable, Identifiable {
    let id                                      = UUID()
    
    var width               : String            = ""
    var height              : String            = ""
    
    var label               : String            = ""
    
    var type                : WindowType        = .singleHung
    var casementSideType    : CasementSideType  = .defaultType
    var glassType           : GlassType         = .defaultType
    var gasType             : GasType           = .defaultType
    var temperedType        : TemperedType      = .defaultType
    var frameType           : FrameType         = .defaultType
    
    var quantity            : Int               = 1
}


// MARK: - Choices
// note: models.py differences in value casing
enum WindowType: String, CaseIterable, Encodable {
    case singleHung         = "Single Hung"
    case doubleHung         = "Double Hung"
    case casement           = "Casement"
    case awning             = "Awning"
}

enum CasementSideType: String, CaseIterable, Encodable {
    case defaultType        = "N/A"
    
    case right              = "Right"
    case left               = "Left"
}

enum SliderType: String, CaseIterable, Encodable {
    case xo                 = "XO"
    case ox                 = "OX"
}

enum GlassType: String, CaseIterable, Encodable {
    case defaultType        = "N/A"
    
    case lowE270            = "Low-E 270"
    case lowE360            = "Low-E 360"
    case obscured           = "Obscured"
}

enum GasType: String, CaseIterable, Encodable {
    case defaultType        = "N/A"
    
    case yes                = "Yes"
    case no                 = "No"
}

enum TemperedType: String, CaseIterable, Encodable {
    case defaultType        = "N/A"
    
    case tempered           = "Tempered"
    case noTempered         = "No Tempered"
}

enum FrameType: String, CaseIterable, Encodable {
    case defaultType        = "N/A"
    
    case blockFrame         = "Block"
    case nailFin            = "Nail Fin"
    case retrofit           = "Stucco"
}
