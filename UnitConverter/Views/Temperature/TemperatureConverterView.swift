//
//  TemperatureConverterView.swift
//  UnitConverter
//
//  Created by Yasser Bal on 04/09/2023.
//

import SwiftUI

struct TemperatureConverterView: View {
    // ViewModel to manage temperature conversion logic
    @StateObject var vm: TemperatureConverterViewModel = TemperatureConverterViewModel()

    // Track TextField focus state
    @FocusState private var isInputFocused: Bool

    var body: some View {
        ScrollView{
            VStack(spacing: 10) {
                // User input form
                inputForm
                Divider()
                // Display converted temperature units
                convertedUnits
            }
            .padding()
        }
        .navigationBarTitle("Temperature")
        .ignoresSafeArea(.keyboard)
    }

    // User input form for temperature conversion
    private var inputForm: some View {
        VStack(spacing: 25) {
            HStack {
                // Text input field for temperature
                TextField("Enter Temperature", text:Binding(
                    get: { self.vm.input },
                    set: { newValue in
                        self.vm.input = newValue.filter { $0.isNumber || $0 == "-" || $0 == "." }
                    })
                )
                    .focused($isInputFocused) // Bind TextField to focus state
                    .keyboardType(.decimalPad)
                // Display selected source temperature unit
                Picker("Select Source Unit", selection: $vm.from) {
                    ForEach(TemperatureConverterViewModel.TemperatureUnit.allCases, id: \.self) { unit in
                        Text(unit.rawValue.capitalized)
                    }
                }
                .pickerStyle(.menu)             }
            // Picker for selecting source temperature unit
            Picker("Convert From", selection: $vm.from) {
                ForEach(TemperatureConverterViewModel.TemperatureUnit.allCases, id: \.self) { unit in
                    Text(unit.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }

    // Display converted temperature units
    private var convertedUnits: some View {
        HStack(spacing: 20) {
            ForEach(TemperatureConverterViewModel.TemperatureUnit.allCases, id: \.self) { unit in
                VStack(alignment: .center) {
                    // Display temperature unit label
                    Text(unit.rawValue)
                        .font(.headline)
                        .foregroundColor(.primary)
                    // Display converted temperature value
                    Text(String(format: "%.2f°", vm.convertTemperature(to: unit)))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
            }
        }
        .padding(.vertical, 10)
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
