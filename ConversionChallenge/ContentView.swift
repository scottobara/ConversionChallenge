//
//  ContentView.swift
//  ConversionChallenge
//
//  Created by Scott Obara on 3/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var metricValue = ""
    @State private var metricUnit = 1
    @State private var imperialValue = ""
    @State private var imperialUnit = 1
    
    
    let metricUnits = ["kilometers", "meters", "centimeters", "millimeters"]
    let metricUnitConversion = [1000, 1, 0.01, 0.001]
    let imperialUnits = ["miles", "yards", "inches"]
    let meterToImperial = [0.000621371192, 1.0936133, 39.3700787]
    
    var imperialOut: Double {
        let metricValueIn = Double(metricValue) ?? 0
        let meterUnitIn = Double(metricUnitConversion[metricUnit])
        let imperialUnitIn = Double(meterToImperial[imperialUnit])
        let imperialValueOut = meterUnitIn * imperialUnitIn * metricValueIn
        
        return imperialValueOut
    }
    
    var body: some View {
        
        NavigationView {
            Form {
                Section(header: Text("Metric").textCase(.uppercase)) {
                    TextField("value", text: $metricValue)
                        .keyboardType(.decimalPad)
                    Picker("type", selection: $metricUnit) {
                        ForEach(0 ..< metricUnits.count) {
                            Text("\(self.metricUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
                Section(header: Text("Imperial").textCase(.uppercase)) {
                    //TextField("value", text: $imperialValue)
                    Text("\(imperialOut, specifier: "%g")")
                        .keyboardType(.decimalPad)
                    Picker("type", selection: $imperialUnit) {
                        ForEach(0 ..< imperialUnits.count) {
                            Text("\(self.imperialUnits[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                }
            }//.listStyle(GroupedListStyle())
            .navigationTitle("Unit Converter")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
