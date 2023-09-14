//
//  TemperatureConverterViewModel.swift
//  UnitConverter
//
//  Created by Yasser Bal on 04/09/2023.
//
import Foundation

/// A view model for temperature conversion.
class TemperatureConverterViewModel: ObservableObject {
    /// The source temperature unit for conversion.
    @Published var from: TemperatureUnit = .fahrenheit
    
    /// The user input for temperature value.
    @Published var input: String = ""
    
    /// A boolean indicating whether the input field is focused.
    @Published var isInputFocused: Bool = false
    
    /// The temperature conversion model responsible for conversion logic.
    private let conversionModel = TemperatureConversionModel()

    /// Converts a temperature value to the specified unit.
    /// - Parameter unit: The target temperature unit for conversion.
    /// - Returns: The converted temperature value.
    func convertTemperature(to unit: TemperatureUnit) -> Double {
        let inputValue = Double(input) ?? 0
        return conversionModel.convertTemperature(value: inputValue, from: from, to: unit)
    }
}
