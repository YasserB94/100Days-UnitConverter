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

    enum TemperatureUnit:String,CaseIterable{
        case celsius = "celsius"
        case fahrenheit = "fahrenheit"
        case kelvin = "Kelvin"
    }
    var body: some View {
        ZStack{
            VStack(spacing:40){
                inputForm
                converterUnits
                Spacer()
            }
            .padding()
            .navigationTitle("Temperature")
        }
        
    }
    
    private var inputForm:some View{
        VStack{
            HStack{
                TextField("Convert", text: Binding(
                    get: { self.input },
                    set: { newValue in
                        let filteredValue = newValue.filter { $0.isNumber }
                        self.input = filteredValue
                    }
                ))
                .keyboardType(.decimalPad)
                Text(from.rawValue.capitalized)
            }
            .padding()
            Picker("Convert From", selection: $from){
                ForEach(TemperatureUnit.allCases,id:\.self) { unit in
                    Text(unit.rawValue.capitalized)
                }
            }.pickerStyle(.segmented)
        }
    }
    
    private var converterUnits:some View{
        HStack(spacing:20){
            ForEach(TemperatureUnit.allCases,id:\.self) {unit in
                VStack(){
                    Text(unit.rawValue)
                    Text(String(format: "%.2f°", convertTemperature(from: from, to: unit, input: Double(input) ?? 0)))
                }
            }
        }
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
