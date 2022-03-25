//
//  ContentView.swift
//  FitnessAppUI
//
//  Created by CEVAT UYGUR on 23.03.2022.
//

import SwiftUI

struct ContentView: View {
    // Optional
    @State var showView: Bool = false
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            if showView {
                Home()
            }
        }
        .frame(maxWidth: .infinity)
        .background {
            ZStack {
                VStack {
                    Circle()
                        .fill(Color("Blue"))
                        .scaleEffect(0.8, anchor: .leading)
                        .offset(x: 50)
                        .blur(radius: 100)
                    
                    Circle()
                        .fill(Color("Green"))
                        .scaleEffect(0.8, anchor: .leading)
                        .offset(y: -20)
                        .blur(radius: 100)
                    
                    Circle()
                        .fill(Color("Red"))
                        .scaleEffect(0.8, anchor: .leading)
                        .offset(x: 50)
                        .blur(radius: 100)
                }
                
                Rectangle()
                    .fill(.ultraThinMaterial)
            }
            .ignoresSafeArea()
        }
        .preferredColorScheme(.dark)
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                showView = true
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
