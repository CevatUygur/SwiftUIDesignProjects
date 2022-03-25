//
//  Home.swift
//  FitnessAppUI
//
//  Created by CEVAT UYGUR on 23.03.2022.
//

import SwiftUI

struct Home: View {
    // UI Properties
    @State var currentWeek: [Date] = []
    @State var currentDay: Date = Date()
    
    // Animation Properties
    @State var showViews: [Bool] = Array(repeating: false, count: 5)
    
    // Preview Bug
    var body: some View {
        VStack(spacing: 20) {
            HStack {
                Text("Health Tracking App")
                    .font(.title)
                    .fontWeight(.bold)
                
                Spacer()
                
                Button {
                    
                } label: {
                    Image(systemName: "ellipsis.circle")
                        .font(.title3)
                }
            }
            .foregroundColor(.white)
            .opacity(showViews[0] ? 1 : 0)
            .offset(y: showViews[0] ? 0 : 200)
            
            // current week View
            HStack(spacing: 10) {
                ForEach(currentWeek, id: \.self) { date in
                    Text(extractDate(date: date))
                        .fontWeight(isSameDay(date1: currentDay, date2: date) ? .bold : .semibold)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, isSameDay(date1: currentDay, date2: date) ? 6 : 0)
                        .padding(.horizontal, isSameDay(date1: currentDay, date2: date) ? 12 : 0)
                        .frame(width: isSameDay(date1: currentDay, date2: date) ? 140 : nil)
                        .background {
                            Capsule()
                                .fill(.ultraThinMaterial)
                                .environment(\.colorScheme, .light)
                                .opacity(isSameDay(date1: currentDay, date2: date) ? 0.8 : 0)
                        }
                        .onTapGesture {
                            withAnimation {
                                currentDay = date
                            }
                        }
                }
            }
            .padding(.top, 10)
            .opacity(showViews[1] ? 1 : 0)
            .offset(y: showViews[1] ? 0 : 250)
            
            VStack(alignment: .leading, spacing: 8) {
                Text("Steps")
                    .fontWeight(.semibold)
                
                Text("8,860")
                    .font(.system(size: 45, weight: .bold))
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.vertical, 15)
            .opacity(showViews[2] ? 1 : 0)
            .offset(y: showViews[2] ? 0 : 200)
            
            // Fitness Ring View
            FitnessRingCardView()
                .opacity(showViews[3] ? 1 : 0)
                .offset(y: showViews[3] ? 0 : 250)
            
            // Bar Grph View
            FitnessStepsGraphView()
                .opacity(showViews[4] ? 1 : 0)
                .offset(y: showViews[4] ? 0 : 200)
        }
        .padding()
        .onAppear(perform: extractCurrentWeek)
        .onAppear(perform: animateViews)
    }
    
    // Animating View
    func animateViews() {
        withAnimation(.easeInOut) {
            showViews[0] = true
        }
        
        withAnimation(.easeInOut.delay(0.1)) {
            showViews[1] = true
        }
        
        withAnimation(.easeInOut.delay(0.15)) {
            showViews[2] = true
        }
        
        withAnimation(.easeInOut.delay(0.20)) {
            showViews[3] = true
        }
        
        withAnimation(.easeInOut.delay(0.35)) {
            showViews[4] = true
        }
    }
    
    // Extracting Current Week
    func extractCurrentWeek() {
        let calender = Calendar.current
        let week = calender.dateInterval(of: .weekOfMonth, for: Date())
        
        guard let firstDay = week?.start else {
            return
        }
        
        (0..<7).forEach { day in
            if let weekDay = calender.date(byAdding: .day, value: day, to: firstDay) {
                currentWeek.append(weekDay)
            }
        }
    }
    
    // Extracting Custom Date Components
    func extractDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = (isSameDay(date1: currentDay, date2: date) ? "dd MMM" : "dd")
        
        return (isDateToday(date: date) && isSameDay(date1: currentDay, date2: date) ? "Today, " : "") + formatter.string(from: date)
    }
    
    // Check date is today or some day
    func isDateToday(date: Date) -> Bool {
        let calender = Calendar.current
        
        return calender.isDateInToday(date)
    }
    
    func isSameDay(date1: Date, date2: Date) -> Bool {
        let calender = Calendar.current
        
        return calender.isDate(date1, inSameDayAs: date2)
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
