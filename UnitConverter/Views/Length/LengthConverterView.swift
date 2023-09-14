//
//  LengthConverterView.swift
//  UnitConverter
//
//  Created by Yasser Bal on 13/09/2023.
//

import SwiftUI

/// A view for length conversion.
struct LengthConverterView: View {
    /// The view model responsible for managing length conversion logic.
    @ObservedObject var vm = LengthConverterViewModel() // Initialize the view model

    /// An array of available length units.
    private var lengthUnits: [LengthUnit] {
        return Array(LengthUnit.allCases)
    }

    var body: some View {
        ScrollView {
            inputForm
            Divider()
            convertedUnits
        }
        .navigationTitle("Length")
        .navigationBarTitleDisplayMode(.inline)
        .ignoresSafeArea(.keyboard)
        .padding()
    }

    /// A view representing the user input form for length conversion.
    private var inputForm: some View {
        HStack {
            TextField("Enter length", text: $vm.inputValue)
                .keyboardType(.decimalPad)
                .padding()
            Picker("From Unit", selection: $vm.fromUnit) {
                ForEach(lengthUnits, id: \.self) { unit in
                    Text(unit.rawValue)
                }
            }
            .pickerStyle(.automatic)
            .padding()
        }
    }

    /// A view displaying the converted length units.
    private var convertedUnits: some View {
        VStack {
            Text("Converted Length Units")
                .font(.title)
                .padding()

            ForEach(lengthUnits, id: \.self) { unit in
                HStack {
                    Text(unit.rawValue)
                        .font(.headline)
                        .foregroundColor(.primary)

                    Spacer()

                    Text(String(format: "%.2f \(unit.abbreviation)", vm.convertLength(to: unit)))
                        .font(.subheadline)
                        .foregroundColor(.secondary)
                }
                .padding(.horizontal)
                .padding(.vertical, 5)
            }
        }
        .padding()
    }
}
struct LengthConverterView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            LengthConverterView()
                .preferredColorScheme(.dark)
        }
    }
}
