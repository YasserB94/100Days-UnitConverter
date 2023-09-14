//
//  LengthConverterViewModel.swift
//  UnitConverter
//
//  Created by Yasser Bal on 13/09/2023.
//
import Foundation

/// A view model for length conversion.
class LengthConverterViewModel: ObservableObject {
    /// The source length unit for conversion.
    @Published var fromUnit: LengthUnit = .meter
    
    /// The user input for length value.
    @Published var inputValue: String = ""
    
    /// A boolean indicating whether the input field is focused.
    @Published var isInputFocused: Bool = false
    
    /// The length conversion model responsible for conversion logic.
    private let conversionModel = LengthConversionModel()

    /// Converts a length value to the specified unit.
    /// - Parameter targetUnit: The target length unit for conversion.
    /// - Returns: The converted length value.
    func convertLength(to targetUnit: LengthUnit) -> Double {
        let inputValue = Double(self.inputValue) ?? 0
        return conversionModel.convertLength(value: inputValue, from: fromUnit, to: targetUnit)
    }
}
