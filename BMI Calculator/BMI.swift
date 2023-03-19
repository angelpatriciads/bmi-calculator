//
//  BMI.swift
//  BMI Calculator
//
//  Created by Angelica Patricia on 19/03/23.
//

import Foundation
import SwiftUI

struct Bmi: Identifiable {
    let id = UUID()
    let date: Date
    let result: Double
    
    func bmiScale() -> String {
        switch result {
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
        switch result {
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
