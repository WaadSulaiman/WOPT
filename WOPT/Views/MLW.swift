//
//  MLW.swift
//  WOPT
//
//  Created by Elmir Abasov on 2021-02-25.
//

/* import Foundation
import SwiftUI

struct MealListView: View {
    @ObservedObject var mealListVM = MealListViewModel()
    let meals = testDataMeals
    
    @State var presentAddNewItem = false
    
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                List {
                    ForEach(mealListVM.mealCellViewModels) { mealCellVM in
                        
                        MealCell(mealCellVM: mealCellVM)
                        
                    }
                    if presentAddNewItem {
                        MealCell(mealCellVM: MealCellViewModel(meals: Meal(title:"", completed: false))) { meals in
                            self.mealListVM.addMeal(meals: meals)
                            self.presentAddNewItem.toggle()
                        }
                    }
                }
                Button(action: {self.presentAddNewItem.toggle()}) {
                    HStack {
                        Image(systemName: "plus.rectangle")
                            .resizable()
                            .frame(width: 30, height: 25)
                    }
                }
                .padding()
            }
            .navigationBarTitle("Meals")
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
struct MealCell: View {
    @ObservedObject var mealCellVM: MealCellViewModel
    //  let meals: Meal
    
    
    var onCommit: (Meal) -> (Void) = { _ in }
    
    var body: some View {
        HStack {
            Image(systemName:  mealCellVM.meals.completed ? "checkmark.square.fill" : "square")
                .resizable()
                .frame(width: 15, height: 15)
                .onTapGesture {
                    self.mealCellVM.meals.completed.toggle()
                }
                    TextField("Enter the meal", text: $mealCellVM.meals.title, onCommit: {
                        self.onCommit(self.mealCellVM.meals)
                    })
                
                    }
                }
            }
        

                */
