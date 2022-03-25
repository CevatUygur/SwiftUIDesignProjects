//
//  Ring.swift
//  FitnessAppUI
//
//  Created by CEVAT UYGUR on 23.03.2022.
//

import SwiftUI

// Progress Ring Model and Sample Data

struct Ring: Identifiable {
    var id = UUID().uuidString
    var progress : CGFloat
    var value: String
    var keyIcon: String
    var keyColor: Color
    var isText: Bool = false
}

var rings: [Ring] = [
    
    Ring(progress: 43, value: "Steps", keyIcon: "figure.walk", keyColor: Color("Green")),
    Ring(progress: 87, value: "Calories", keyIcon: "flame.fill", keyColor: Color("Red")),
    Ring(progress: 65, value: "Sleep time", keyIcon: "😴", keyColor: Color("Purple"), isText: true)
    
]
