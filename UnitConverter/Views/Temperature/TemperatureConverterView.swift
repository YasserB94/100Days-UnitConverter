//
//  TemperatureConverterView.swift
//  UnitConverter
//
//  Created by Yasser Bal on 04/09/2023.
//
import Foundation
import SwiftUI

/// A view for temperature conversion.
struct TemperatureConverterView: View {
    /// The view model responsible for managing temperature conversion logic.
    @StateObject var vm: TemperatureConverterViewModel = TemperatureConverterViewModel()

    /// Track TextField focus state
    @FocusState private var isInputFocused: Bool

    var body: some View {
        ScrollView {
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
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.keyboard)
    }

    /// A view representing the user input form for temperature conversion.
    private var inputForm: some View {
        VStack(spacing: 25) {
            HStack {
                // Text input field for temperature
                TextField("Enter Temperature", text: $vm.input)
                    .focused($isInputFocused) // Bind TextField to focus state
                    .keyboardType(.decimalPad)
                // Display selected source temperature unit
                Picker("Select Source Unit", selection: $vm.from) {
                    ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                        Text(unit.rawValue.capitalized)
                    }
                }
                .pickerStyle(.menu)
            }
        }
        .padding()
    }

    /// A view displaying the converted temperature units.
    private var convertedUnits: some View {
        VStack {
            Text("Converted Temperature Units")
                .font(.title)
                .padding(.bottom, 10)

            ForEach(TemperatureUnit.allCases, id: \.self) { unit in
                HStack {
                    Text(unit.rawValue.capitalized)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Spacer()

                    Text(String(format: "%.2f°", vm.convertTemperature(to: unit)))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
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
