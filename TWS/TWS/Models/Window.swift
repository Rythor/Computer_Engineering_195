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
struct Window: Hashable, Codable, Identifiable {
    // MARK: - Properties
    let id                                          = UUID()
    
    var width                   : String            = ""
    var height                  : String            = ""
    
    var room                    : String            = ""
    
    var openingType             : OpeningType       = .noSelection
    
    var windowType              : WindowType?       = nil
    var windowInsertType        : WindowInsertType? = nil
    var slidingDoorType         : SlidingDoorType?  = nil
    var hingedDoorType          : HingedDoorType?   = nil
    
    // defaulting the following group for now
    var category                : String            = "Signature"
    var productLine             : String            = "Ultimate-Clad"
    var frameInstallation       : String            = "Nailing Fin"
    var glass                   : String            = "Clear"
    var color                   : String            = "Stone White"
    
    var quantity                : String            = "1"
    
    
    // MARK: - Methods
    public func getDictionaryRepresentation() throws -> Dictionary<String,String> {
        let encoder = JSONEncoder()
        
        var data = Data()
        do {
            data = try encoder.encode(self)
        } catch { print("could not encode the window object into json") }
        
        guard let representation = try JSONSerialization.jsonObject(with: data, options: []) as? [String:String] else {
            throw WindowConversionError.unableToConvert(message: "could not convert the window json object into a dictionary")
        }
        
        return representation
    }
}


extension Window {
    enum WindowConversionError: Error {
        case unableToConvert(message: String)
    }
}


extension Window {
    /*
        the " # " prefixes are being used as lexicographic, order-preserving placeholders.
     
        it's a hacky kind of solution, but we don't have ordered dictionaries in swift so this is what made the most sense
        to preserve some type of order when encoding the object into json.
        
        the fact that the rpa requires the windows to be represented in a string (at the top-level) makes the order matter and
        is what made this messy in the first place

     */
    private enum CodingKeys: String, CodingKey {
        case width              = " 05 Width"
        case height             = " 06 Height"
        
        case room               = " 03 Room"
        
        case windowType         = " 04 Window Type"
        case windowInsertType   = " 04 Window Insert Type"
        case slidingDoorType    = " 04 Sliding Door Type"
        case hingedDoorType     = " 04 Hinged Door Type"
        
        case category           = " 00 Category"
        case productLine        = " 01 Product Line"
        case frameInstallation  = " 02 Frame/Installation"
        case glass              = " 07 Glass"
        case color              = " 08 Color"
        
        case quantity           = " 09 Quantity"
    }
}


// MARK: - Choices

enum OpeningType: String, CaseIterable, Codable {
    case noSelection        = "--"
    case window             = "Window"
    case windowInsert       = "Window Insert"
    case slidingDoor        = "Sliding Door"
    case hingedDoor         = "Hinged Door"
}

enum WindowType: String, CaseIterable, Codable {
    case fixedWindow        = "Fixed Window"
    case singleHung         = "Single Hung"
    case doubleHung         = "Double Hung"
    case lhCasement         = "LH Casement"
    case rhCasement         = "RH Casement"
    case xoSlider           = "XO Slider"
    case oxSlider           = "OX Slider"
    case awning             = "Awning"
}

enum WindowInsertType: String, CaseIterable, Codable {
    case fixedWindow        = "Fixed Window"
    case singleHung         = "Single Hung"
    case doubleHung         = "Double Hung"
    case lhCasement         = "LH Casement"
    case rhCasement         = "RH Casement"
    case xoSlider           = "XO Slider"
    case oxSlider           = "OX Slider"
    case awning             = "Awning"
}

enum SlidingDoorType: String, CaseIterable, Codable {
    case xoSlider           = "XO Slider"
    case oxSlider           = "OX Slider"
    case oxoSliderLeft      = "OXO Slider Left"
    case oxoSliderRight     = "OXO Slider Right"
    case oxxoSlider         = "OXXO Slider"
}

enum HingedDoorType: String, CaseIterable, Codable {
    case singleLH           = "Single LH"
    case singleRH           = "Single RH"
    case doubleXO           = "Double XO"
    case doubleOX           = "Double OX"
}
