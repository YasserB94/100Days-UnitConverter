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
            ZStack{
                List{
                    NavigationLink {
                        TemperatureConverterView()
                    } label: {
                        Text("Temperature")
                    }
                }

            }.navigationTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
