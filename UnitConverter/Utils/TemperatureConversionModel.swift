//
//  TemperatureConversionModel.swift
//  UnitConverter
//
//  Created by Yasser Bal on 13/09/2023.
//

import Foundation

/// A model for temperature conversion.
class TemperatureConversionModel {
    /// Converts a temperature value from one unit to another.
    /// - Parameters:
    ///   - value: The temperature value to convert.
    ///   - sourceUnit: The source temperature unit.
    ///   - targetUnit: The target temperature unit.
    /// - Returns: The converted temperature value.
    func convertTemperature(value: Double, from sourceUnit: TemperatureUnit, to targetUnit: TemperatureUnit) -> Double {
        // Temperature conversion logic
        switch (sourceUnit, targetUnit) {
        case (.celsius, .fahrenheit):
            return (value * 9/5) + 32
        case (.celsius, .kelvin):
            return value + 273.15
        case (.fahrenheit, .celsius):
            return (value - 32) * 5/9
        case (.fahrenheit, .kelvin):
            return (value - 32) * 5/9 + 273.15
        case (.kelvin, .celsius):
            return value - 273.15
        case (.kelvin, .fahrenheit):
            return (value - 273.15) * 9/5 + 32
        default:
            // If the source and target units are the same, return the original value.
            return value
        }
    }
}





