//
//  MealCellViewModel.swift
//  WOPT
//
//  Created by Elmir Abasov on 2021-02-12.
//
import Foundation
import Combine

//TODO: Create a class that is observableobject so swift ui can observe any changes we make to the properties to the viewmodel
class MealCellViewModel: ObservableObject, Identifiable {
    @Published var meals: Meal
    
    var id = ""
    @Published var completionStateIconName = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(meals: Meal) {
        self.meals = meals
        
        $meals
            .map { meals in
                meals.completed ? "checkmark.square.fill" : "square"
            }
            .assign(to: \.completionStateIconName, on:self)
            .store(in: &cancellables)
        
        $meals
        .compactMap { meals in
            meals.id
        }
        .assign(to: \.id, on:self)
        .store(in: &cancellables)
    }
    
}
