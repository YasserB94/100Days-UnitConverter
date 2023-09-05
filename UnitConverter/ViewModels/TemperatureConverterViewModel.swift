//
//  TemperatureConverterViewModel.swift
//  UnitConverter
//
//  Created by Yasser Bal on 04/09/2023.
//

import Foundation

class TemperatureConverterViewModel: ObservableObject {
    // Properties to track temperature conversion
    @Published var from: TemperatureUnit = .celsius
    @Published var input: String = ""
    @Published var isInputFocused: Bool = false // Track TextField focus
    @Published var to: TemperatureUnit = .celsius

    // Enumeration for temperature units
    enum TemperatureUnit: String, CaseIterable {
        case celsius = "Celsius"
        case fahrenheit = "Fahrenheit"
        case kelvin = "Kelvin"
    }

    // Function to perform temperature conversion
    func convertTemperature(to targetUnit: TemperatureUnit) -> Double {
        let inputValue = Double(input) ?? 0

        // Temperature conversion logic based on source and target units
        switch (from, targetUnit) {
        case (.celsius, .fahrenheit):
            return (inputValue * 9/5) + 32
        case (.celsius, .kelvin):
            return inputValue + 273.15
        case (.fahrenheit, .celsius):
            return (inputValue - 32) * 5/9
        case (.fahrenheit, .kelvin):
            return (inputValue - 32) * 5/9 + 273.15
        case (.kelvin, .celsius):
            return inputValue - 273.15
        case (.kelvin, .fahrenheit):
            return (inputValue - 273.15) * 9/5 + 32
        default:
            return inputValue
        }
    }
}
