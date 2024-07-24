//
//  Activities.swift
//  HabitTracker
//
//  Created by Oliver Hu on 4/3/24.
//

import Foundation

@Observable
class Activities {
    var activities: [Activity] {
        // items get saved when items are added
        didSet {
            if let encoded = try? JSONEncoder().encode(activities) {
                UserDefaults.standard.set(encoded, forKey: "Activities")
            }
        }
    }
    
    // items are loaded when app relaunches
    init() {
        if let saved = UserDefaults.standard.data(forKey: "Activities") {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: saved) {
                activities = decoded
                return
            }
        }

        activities = []
    }
}
