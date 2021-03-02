//
//  ExerciseModel.swift
//  Created by Waad on 18/02/21.


import Foundation
import SwiftUI
import Combine

struct MealModel : Identifiable {
    var title: String
    var kcal: Int
    //var timer: String
    var completed: Bool
    @ServerTimestamp var createdTime: Timestamp? // Timestamp for making sure all database is in sync
    }
    
    //Add more complicated stuff later if you want.
    
}

class ExerciseStore : ObservableObject {
    @Published var exercises = [Exercise]()
}
