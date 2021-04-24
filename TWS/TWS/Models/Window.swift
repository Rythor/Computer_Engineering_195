//
//  Window.swift
//  TWS
//
//  Created by Brian Tamsing on 2/14/21.
//

import Foundation

///
/// Represents a Marvin Window instance.
///
struct Window: Hashable, Encodable, Identifiable {
    let id                                      = UUID()
    
    var width               : String            = ""
    var height              : String            = ""
    
    var label               : String            = ""
    
    var openingType         : OpeningType       = .noSelection
    
    var windowType          : WindowType?       = nil
    var windowInsertType    : WindowInsertType? = nil
    var slidingDoorType     : SlidingDoorType?  = nil
    var hingedDoorType      : HingedDoorType?   = nil
    
    var quantity            : Int               = 1
}


// MARK: - Choices

enum OpeningType: String, CaseIterable, Encodable {
    case noSelection        = "--"
    case window             = "Window"
    case windowInsert       = "Window Insert"
    case slidingDoor        = "Sliding Door"
    case hingedDoor         = "Hinged Door"
}

enum WindowType: String, CaseIterable, Encodable {
    case fixedWindow        = "Fixed Window"
    case singleHung         = "Single Hung"
    case doubleHung         = "Double Hung"
    case lhCasement         = "LH Casement"
    case rhCasement         = "RH Casement"
    case xoSlider           = "XO Slider"
    case oxSlider           = "OX Slider"
    case awning             = "Awning"
}

enum WindowInsertType: String, CaseIterable, Encodable {
    case fixedWindow        = "Fixed Window"
    case singleHung         = "Single Hung"
    case doubleHung         = "Double Hung"
    case lhCasement         = "LH Casement"
    case rhCasement         = "RH Casement"
    case xoSlider           = "XO Slider"
    case oxSlider           = "OX Slider"
    case awning             = "Awning"
}

enum SlidingDoorType: String, CaseIterable, Encodable {
    case xoSlider           = "XO Slider"
    case oxSlider           = "OX Slider"
    case oxoSliderLeft      = "OXO Slider Left"
    case oxoSliderRight     = "OXO Slider Right"
    case oxxoSlider         = "OXXO Slider"
}

enum HingedDoorType: String, CaseIterable, Encodable {
    case singleLH           = "Single LH"
    case singleRH           = "Single RH"
    case doubleXO           = "Double XO"
    case doubleOX           = "Double OX"
}

// MARK: - Old,
/* but possibly still needed
enum GlassType: String, CaseIterable, Encodable {
    case defaultType        = "N/A"
    
    case lowE270            = "Low-E 270"
    case lowE360            = "Low-E 360"
    case obscured           = "Obscured"
}
 */
