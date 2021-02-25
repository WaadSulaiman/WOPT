//
//  ContentView.swift
//  WOPT
//
//  Created by Waad on 2021-02-04.
//
 import SwiftUI

struct MealListView: View {
    @ObservedObject var mealListVM = MealListViewModel()
    let meals = testDataMeals
    
    @State var presentAddNewItem = false
    
    
    var body: some View {
        // TODO: create a completion image
        // CANDO: Set everything in navigationview and put up navigationbartitle
        
        VStack(alignment: .trailing) {
            Button(action: {self.presentAddNewItem.toggle()}) {
                Image(systemName: "plus.rectangle")
                    .resizable()
                    .frame(width: 30, height: 25)
                
            }
            .padding(.trailing)
            NavigationView {
                
                VStack {
                    
                    
                    
                    VStack(alignment: .leading) {
                        List {
                            ForEach(mealListVM.mealCellViewModels) { mealCellVM in
                                
                                MealCell(mealCellVM: mealCellVM)
                                
                            }
                            //TODO: Depending on if the addneditem is true or false present new cell
                            
                            if presentAddNewItem {
                                MealCell(mealCellVM: MealCellViewModel(meals: Meal(title:"", completed: false))) { meals in
                                    self.mealListVM.addMeal(meals: meals)
                                    self.presentAddNewItem.toggle()
                                }
                            }
                        }
                        
                    }
                    
                    
                }
                
                
                .navigationBarTitle("Meals")
            
                
                
            }
        }
        
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}

/* Text("Meals")
 .font(.title)
 .fontWeight(.bold)
 .multilineTextAlignment(.center) */
// .padding(.horizontal, 140.0)
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
            
            
            .padding(.vertical, 50.0)
            
            
            
            
            Toggle(isOn: /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Is On@*/.constant(true)/*@END_MENU_TOKEN@*/) {
                // Text(mealCellVM.meals.timer)
            }
        }
    }
}

