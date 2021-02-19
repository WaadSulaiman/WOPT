//
//  Meal.swift
//  WOPT
//
//  Created by Elmir Abasov on 2021-02-09.
//

import Foundation

struct Meal: Codable, Identifiable {
    var id: String = UUID().uuidString
    

// TODO: What to track
var title: String
var timer: String
var completed: Bool
     
}

//TODO Create a collection of mock/testdata

#if DEBUG
let testDataMeals = [
    Meal(title: "impelement the UI", timer: "08:00", completed: true),
    Meal(title: "Implemenet firebase", timer: "09:00", completed: false),
    Meal(title: "????", timer: "??:??", completed: false),
    Meal(title: "Profit!!", timer: "11:00", completed: false)
]
#endif


