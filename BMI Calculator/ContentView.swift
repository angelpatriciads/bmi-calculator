//
//  ContentView.swift
//  BMI Calculator
//
//  Created by Angelica Patricia on 19/03/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var index = 0
    @State private var weight = 45.0
    @State private var height = 155.0
    @State private var savedHistories = [
        Bmi(date: Date(), result: 24.22)
    ]
    
    var body: some View {
        NavigationView {
    
            VStack {
                
                //Picker
                Picker("BMI?", selection: $index) {
                    Text("Calculator")
                        .tag(0)
                    Text("History")
                        .tag(1)
                }
                .pickerStyle(.segmented)
                .padding()
            
                if index==0 {
                    //Calculator View
                    Calculator_View(
                        weight: $weight,
                        height: $height,
                        savedHistories: $savedHistories
                    )
                } else {
                    //History View
                    History_View(savedHistories: $savedHistories)

                }

            }
            .navigationTitle("Body Mass Index")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
