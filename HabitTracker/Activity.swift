//
//  Habit.swift
//  HabitTracker
//
//  Created by Oliver Hu on 4/3/24.
//

import Foundation

struct Activity: Identifiable, Codable, Equatable {
    var id = UUID()
    var title: String
    var description: String
    var completionCount = 0
    
    static let example = Activity(title: "Example activity", description: "This is a test activity.")
}

