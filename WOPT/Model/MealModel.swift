//
//  ExerciseModel.swift
//  Created by Waad on 18/02/21.


import Foundation
import SwiftUI
import Combine

struct Meal : Identifiable {
    var id: String
    var title: String
    var kcal: Int

    
}

class MealStore : ObservableObject {
    @Published var meals = [Meal]()
}
