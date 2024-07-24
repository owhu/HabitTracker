//
//  ContentView.swift
//  HabitTracker
//
//  Created by Oliver Hu on 4/3/24.
//

import SwiftUI

struct ContentView: View {
    @State private var data = Activities()
    @State private var addingNewActivity = false
    
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(data.activities) { activity in
                    NavigationLink {
                        ActivityView(data: data, activity: activity)
                    } label: {
                        HStack {
                            Text(activity.title)
                            
                            Spacer()
                            
                            Text(String(activity.completionCount))
                                .font(.caption.weight(.black))
                                .padding(5)
                                .frame(minWidth: 50)
                                .background(color(for: activity))
                                .foregroundStyle(.white)
                                .clipShape(.capsule)
                        }
                    }
                }
                .onDelete(perform: removeItems)
            }
            .navigationTitle("Habits")
            .toolbar {
                Button("Add new activity", systemImage: "plus") {
                    addingNewActivity.toggle()
                }
            }
            .sheet(isPresented: $addingNewActivity) {
                AddActivity(data: data)
            }
        }
    }
    
    func color(for activity: Activity) -> Color {
        if activity.completionCount <  3 {
            .red
        } else if activity.completionCount < 10 {
            .yellow
        } else if activity.completionCount < 20 {
            .green
        } else if activity.completionCount < 50 {
            .blue
        } else {
            .indigo
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        data.activities.remove(atOffsets: offsets)
    }
}


#Preview {
    ContentView()
}
