//
//  MealListViewModel.swift
//  WOPT
//
//  Created by Elmir Abasov on 2021-02-12.
//
import Foundation
import Combine

class MealListViewModel: ObservableObject {
    @Published var mealRepository = MealRepository()
    @Published var mealCellViewModels = [MealCellViewModel]()
    
    private var cancellables = Set<AnyCancellable>()
    
    
    //TODO: Initializer where we operate our test data and convert test meals into mealscell view models
    init() {
        mealRepository.$meals
         .map { meals in
            meals.map { meals in
                MealCellViewModel(meals: meals)
            }
        }
            .assign(to: \.mealCellViewModels, on: self)
            .store(in: &cancellables)
        
    }
    func addMeal(meals: Meal) {
        let mealVM = MealCellViewModel(meals:meals)
        self.mealCellViewModels.append(mealVM)
    }
}
