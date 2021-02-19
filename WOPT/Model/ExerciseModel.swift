//
//  ExerciseModel.swift
//  Created by Waad on 18/02/21.

import Foundation

import Foundation
import SwiftUI
import Combine

struct Exercise : Identifiable {
    var id = String()
    var toDoItem = String()
    
    //Add more complicated stuff later if you want.
    
}

class ExerciseStore : ObservableObject {
    @Published var exercises = [Exercise]()
}
