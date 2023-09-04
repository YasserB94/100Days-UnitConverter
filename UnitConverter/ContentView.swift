//
//  ContentView.swift
//  UnitConverter
//
//  Created by Yasser Bal on 04/09/2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack{
            TemperatureConverterView()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
