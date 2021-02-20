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
struct Window {
    var width               : String
    var height              : String
    
    var label               : String
    
    var type                : WindowType?
    var casementSideType    : CasementSideType  = .defaultType
    var glassType           : GlassType         = .defaultType
    var gasType             : GasType           = .defaultType
    var temperedType        : TemperedType      = .defaultType
    var frameType           : FrameType         = .defaultType
    
    var quantity            : Int               = 1
}


// MARK: - Choices

enum WindowType: String {
    case singleHung         = "SH"
    case doubleHung         = "DH"
    case casement           = "casement"
    case awning             = "awning"
}

enum CasementSideType: String {
    case right              = "right"
    case left               = "left"
    
    case defaultType        = "N/A"
}

enum SliderType: String {
    case xo                 = "XO"
    case ox                 = "OX"
}

enum GlassType: String {
    case lowE270            = "Low-E 270"
    case lowE360            = "Low-E 360"
    case obscured           = "Obscured"
    
    case defaultType        = "N/A"
}

enum GasType: String {
    case yes                = "Yes"
    case no                 = "No"
    
    case defaultType        = "N/A"
}

enum TemperedType: String {
    case tempered           = "Tempered"
    case noTempered         = "No Tempered"
    
    case defaultType        = "N/A"
}

enum FrameType: String {
    case blockFrame         = "Block"
    case nailFin            = "Nail Fin"
    case retrofit           = "Stucco"
    
    case defaultType        = "N/A"
}
