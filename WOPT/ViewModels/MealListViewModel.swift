//
//  MealListViewModel.swift
//  WOPT
//
//  Created by Elmir Abasov on 2021-02-12.
//
import Foundation
import Combine

class MealListViewModel: ObservableObject {
    @Published var mealCellViewModels = [MealCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    
    //TODO: Initializer where we operate our test data and convert test meals into mealscell view models
    init() {
        self.mealCellViewModels = testDataMeals.map { meals in
            MealCellViewModel(meals: meals)
            
        }
        
    }
    func addMeal(meals: Meal) {
        let mealVM = MealCellViewModel(meals:meals)
        self.mealCellViewModels.append(mealVM)
    }
}
