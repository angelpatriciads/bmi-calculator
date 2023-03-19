//
//  Calculator View.swift
//  BMI Calculator
//
//  Created by Angelica Patricia on 19/03/23.
//

import SwiftUI

struct Calculator_View: View {
    
    @Binding var weight: Double
    @Binding var height: Double
    @Binding var savedHistories: [Bmi]
    
    var body: some View {
        VStack {
            // Weight
            HStack {
                Text("Weight (Kg)")
                    .foregroundColor(.gray)
                Spacer()
                Text("\(Int(weight))")
                    .font(.title)
                    .bold()
            }
            Slider(value: $weight, in: 1...150)
            
            // Height
            HStack {
                Text("Height (cm)")
                    .foregroundColor(.gray)
                Spacer()
                Text("\(Int(height))")
                    .font(.title)
                    .bold()
            }
            Slider(value: $height, in: 1...250)
            
            // Your Body Mass Index
            HStack {
                Text("Your Body Mass Index")
                    .foregroundColor(.gray)
                Spacer()
                VStack (alignment: .trailing) {
                    Text(String(format: "%.2f", calculateBmi()))
                        .bold()
                        .font(.largeTitle)
                    Text("\(bmiScale())")
                        .foregroundColor(bmiColor())
                }
            }
            
            // Save to History Button
            Button {
                let newBmi = Bmi(date: Date(),result: calculateBmi())
                savedHistories.insert(newBmi, at: 0)
                
            } label: {
                Text("Save to history")
                    .frame(maxWidth: .infinity, maxHeight: 32)
            }
            .buttonStyle(.bordered)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(8)
            
            Spacer()
        }
        .padding()
    }
    
    func calculateBmi() -> Double {
        return weight * 10_000 / ( height * height )
        }
    
    func bmiScale() -> String {
            switch calculateBmi() {
            case 0 ..< 18.4 :
                return "Underweight"
            case 18.5 ..< 24.9 :
                return "Normal"
            case 25 ..< 39.9 :
                return "Overweight"
            default :
                return "Obese"
            }
        }
    
    func bmiColor() -> Color {
        switch calculateBmi() {
        case 0 ..< 18.4 :
            return .blue
        case 18.5 ..< 24.9 :
            return .green
        case 25 ..< 39.9 :
            return .orange
        default :
            return .red
        }
    }
}

struct Calculator_View_Previews: PreviewProvider {
    static var previews: some View {
        Calculator_View(
            weight: .constant(45),
            height: .constant(155),
            savedHistories: .constant([])
        )
    }
}
