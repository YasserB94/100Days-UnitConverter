//
//  TemperatureConverterView.swift
//  UnitConverter
//
//  Created by Yasser Bal on 04/09/2023.
//

import SwiftUI

struct TemperatureConverterView: View {
    @StateObject var vm: TemperatureConverterViewModel = TemperatureConverterViewModel()
    @FocusState private var isInputFocused: Bool // Track TextField focus
    var body: some View {
        VStack(spacing: 10) {
            inputForm
            Divider()
            convertedUnits
        }
        Spacer()
        .padding()
        .navigationBarTitle("Temperature")
    }

    private var inputForm: some View {
        VStack(spacing: 25) {
            HStack {
                TextField("Enter Temperature", text: $vm.input)
                    .focused($isInputFocused) // Bind TextField to focus state
                    .keyboardType(.decimalPad)
                Text(vm.from.rawValue.capitalized)
                    .font(.headline)
                    .foregroundColor(.primary)
                    .onTapGesture {
                        vm.isInputFocused = true
                    }
            }
            Picker("Convert From", selection: $vm.from) {
                ForEach(TemperatureConverterViewModel.TemperatureUnit.allCases, id: \.self) { unit in
                    Text(unit.rawValue.capitalized)
                }
            }
            .pickerStyle(.segmented)
        }
        .padding()
    }

    private var convertedUnits: some View {
        HStack(spacing: 20) {
            ForEach(TemperatureConverterViewModel.TemperatureUnit.allCases, id: \.self) { unit in
                VStack(alignment: .center) {
                    Text(unit.rawValue)
                        .font(.headline)
                        .foregroundColor(.primary)
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
