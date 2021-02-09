//
//  Meal.swift
//  WOPT
//
//  Created by Elmir Abasov on 2021-02-09.
//

import Foundation

struct Meal {
    

// TODO: What to track
var title: String
var timer: Date
var completed: Bool
     
}

//TODO Create a collection of mock/testdata

#if DEBUG
let testDataTasks = [
    Meal(title: "impelement the UI", timer: Date(), completed: true),
    Meal(title: "Implemenet firebase", timer: Date(), completed: false),
    Meal(title: "????", timer: Date(), completed: false),
    Meal(title: "Profit!!", timer: Date(), completed: false)
]
#endif


