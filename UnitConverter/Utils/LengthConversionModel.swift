//
//  LengthConverterModel.swift
//  UnitConverter
//
//  Created by Yasser Bal on 13/09/2023.
//
import Foundation

/// A model for length conversion.
class LengthConversionModel {
    /// Converts a length value from one unit to another.
    /// - Parameters:
    ///   - value: The length value to convert.
    ///   - unit: The source length unit.
    ///   - target: The target length unit.
    /// - Returns: The converted length value.
    func convertLength(value: Double, from unit: LengthUnit, to target: LengthUnit) -> Double {
        // Convert the input value to meters using the "from" unit
        let valueInMeters = toMeters(value, from: unit)
        
        // Convert from meters to the "target" unit
        let result = toTargetUnit(valueInMeters, to: target)
        return result
    }
    
    /// Converts a length value to meters.
    /// - Parameters:
    ///   - value: The length value to convert.
    ///   - unit: The length unit of the input value.
    /// - Returns: The length value in meters.
    private func toMeters(_ value: Double, from unit: LengthUnit) -> Double {
        switch unit {
        case .meter: return value
        case .kilometer: return value * 1000.0
        case .decimeter: return value * 0.1
        case .millimeter: return value * 0.001
        case .nanometer: return value * 1e-9
        case .mile: return value * 1609.34
        case .yard: return value * 0.9144
        case .foot: return value * 0.3048
        case .inch: return value * 0.0254
        case .lightyear: return value * 9.461e15
        case .exameter: return value * 1e18
        case .petameter: return value * 1e15
        case .terameter: return value * 1e12
        }
    }
    
    /// Converts a length value from meters to the target unit.
    /// - Parameters:
    ///   - value: The length value in meters.
    ///   - unit: The target length unit.
    /// - Returns: The converted length value.
    private func toTargetUnit(_ value: Double, to unit: LengthUnit) -> Double {
        switch unit {
        case .meter: return value
        case .kilometer: return value / 1000.0
        case .decimeter: return value / 0.1
        case .millimeter: return value / 0.001
        case .nanometer: return value / 1e-9
        case .mile: return value / 1609.34
        case .yard: return value / 0.9144
        case .foot: return value / 0.3048
        case .inch: return value / 0.0254
        case .lightyear: return value / 9.461e15
        case .exameter: return value / 1e18
        case .petameter: return value / 1e15
        case .terameter: return value / 1e12
        }
    }
}
