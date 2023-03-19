//
//  History View.swift
//  BMI Calculator
//
//  Created by Angelica Patricia on 19/03/23.
//

import SwiftUI

struct History_View: View {
    @Binding var savedHistories: [Bmi]
    
    var body: some View {
        List(savedHistories) {
            Bmi in VStack {
                VStack(alignment: .leading){
                    Text("\(Date().formatted(date: .abbreviated, time: .shortened))")
                        .foregroundColor(.gray)
                    HStack {
                        Text(String(format: "%.2f",Bmi.result))
                            .bold()
                            .font(.largeTitle)
                        
                        Spacer()
                        
                        Text("\(Bmi.bmiScale())")
                            .foregroundColor(Bmi.bmiColor())
                    }
                }
            }
        }
        
        Spacer()
    }
}

struct History_View_Previews: PreviewProvider {
    static var previews: some View {
        History_View(
            savedHistories: .constant(
                [Bmi(date:Date(), result:23.2)]))
    }
}
