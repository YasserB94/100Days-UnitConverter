//
//  LengthUnit.swift
//  UnitConverter
//
//  Created by Yasser Bal on 13/09/2023.
//

import Foundation

/// An enumeration representing various length units.
enum LengthUnit: String, CaseIterable {
    case meter = "Meter"
    case kilometer = "Kilometer"
    case decimeter = "Decimeter"
    case millimeter = "Millimeter"
    case nanometer = "Nanometer"
    case mile = "Mile"
    case yard = "Yard"
    case foot = "Foot"
    case inch = "Inch"
    case lightyear = "Light year"
    case exameter = "Exameter"
    case petameter = "Petameter"
    case terameter = "Terameter"

    /// The abbreviation of the length unit.
    var abbreviation: String {
        switch self {
        case .meter: return "m"
        case .kilometer: return "km"
        case .decimeter: return "dm"
        case .millimeter: return "mm"
        case .nanometer: return "nm"
        case .mile: return "mi"
        case .yard: return "yd"
        case .foot: return "ft"
        case .inch: return "in"
        case .lightyear: return "ly"
        case .exameter: return "Em"
        case .petameter: return "Pm"
        case .terameter: return "Tm"
        }
    }
}

