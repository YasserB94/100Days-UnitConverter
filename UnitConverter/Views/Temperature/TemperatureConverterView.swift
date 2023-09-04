//
//  TemperatureConverterView.swift
//  UnitConverter
//
//  Created by Yasser Bal on 04/09/2023.
//

import SwiftUI

struct TemperatureConverterView: View {
    @State var from:TemperatureUnit = .celsius
    @State var input:String = ""
    @FocusState private var isInputFocused: Bool // Track TextField focus


    enum TemperatureUnit:String,CaseIterable{
        case celsius = "celsius"
        case fahrenheit = "fahrenheit"
        case kelvin = "Kelvin"
    }
    var body: some View {
        VStack(spacing: 5) {
            inputForm
            Divider() // Add a divider for separation
            converterUnits
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .navigationBarTitle("Temperature")
    }
    
    private var inputForm: some View {
        VStack(spacing: 10) { // Add spacing between elements
            HStack {
                TextField("Enter Temperature", text: Binding(
                    get: { self.input },
                    set: { newValue in
                        let filteredValue = newValue.filter { $0.isNumber }
                        self.input = filteredValue
                    }
                ))
                .focused($isInputFocused) // Bind TextField to focus state
                .keyboardType(.decimalPad)
                Text(from.rawValue.capitalized)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .onTapGesture {
                        isInputFocused = true
                    }
            }
            Picker("Convert From", selection: $from) {
                ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                    Text(unit.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented) // Apply a segmented picker style
        }
        .padding() // Add overall padding
    }
    
    private var converterUnits: some View {
        HStack(spacing: 20) {
            ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                VStack(alignment: .center) { // Adjust alignment as needed
                    Text(unit.rawValue)
                        .font(.headline) // Apply a headline font style
                        .foregroundColor(.primary) // Apply the primary text color
                    Text(String(format: "%.2f°", convertTemperature(from: from, to: unit, input: Double(input) ?? 0)))
                        .font(.subheadline) // Apply a subheadline font style
                        .foregroundColor(.secondary) // Apply a secondary text color
                }
            }
        }
        .padding(.vertical, 10) // Add vertical padding for spacing
    }
        
    
    func convertTemperature(from sourceUnit: TemperatureUnit, to targetUnit: TemperatureUnit, input: Double) -> Double {
        switch (sourceUnit, targetUnit) {
        case (.celsius, .fahrenheit):
            return (input * 9/5) + 32
        case (.celsius, .kelvin):
            return input + 273.15
        case (.fahrenheit, .celsius):
            return (input - 32) * 5/9
        case (.fahrenheit, .kelvin):
            return (input - 32) * 5/9 + 273.15
        case (.kelvin, .celsius):
            return input - 273.15
        case (.kelvin, .fahrenheit):
            return (input - 273.15) * 9/5 + 32
        default:
            return input
        }
    }
}

struct TemperatureConverterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            TemperatureConverterView()
                .preferredColorScheme(.dark)
        }
    }
}
