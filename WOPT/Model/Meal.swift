//
//  Meal.swift
//  WOPT
//
//  Created by Elmir Abasov on 2021-02-09.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

struct Meal: Codable, Identifiable {
  @DocumentID var id: String?
    

// TODO: What to track
var title: String
//var timer: String
var completed: Bool
@ServerTimestamp var createdTime: Timestamp? // Timestamp for making sure all database is in sync 
}

//TODO Create a collection of mock/testdata

#if DEBUG
let testDataMeals = [
    Meal(title: "impelement the UI", completed: true),
    Meal(title: "Implemenet firebase", completed: false),
    Meal(title: "????", completed: false),
    Meal(title: "Profit!!", completed: false)
]
#endif


