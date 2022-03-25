//
//  Step.swift
//  FitnessAppUI
//
//  Created by CEVAT UYGUR on 23.03.2022.
//

import SwiftUI

// Steps Bar Graph Model and Sample Data

struct Step: Identifiable {
    var id = UUID().uuidString
    var value: CGFloat
    var key: String
    var color: Color = Color("Purple")
}

var steps: [Step] = [

    Step(value: 320, key: "1-4 AM"),
    Step(value: 719, key: "5-8 AM", color: Color("Green")),
    Step(value: 1286, key: "9-11 AM"),
    Step(value: 2187, key: "12-4 PM", color: Color("Green")),
    Step(value: 3219, key: "5-8 PM"),
    Step(value: 1129, key: "9-12 PM", color: Color("Green"))
    
]

