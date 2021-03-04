//
//  SessionView.swift
//  Created by Waad on 18/02/21.

import SwiftUI
import Combine
import UserNotifications

struct MealListView: View {
    private let repository = MealRepository()
    @ObservedObject var mealStore = MealStore()
    @State var newMeal: String = ""
    @State var newMealKcal: String = ""
    @State private var isSheetShowing = false
    private var totalKcal = 0
    @Environment(\.presentationMode)
    var presentationmMode
    var searchBar : some View {
        VStack(alignment: .leading
        ){
            HStack {
                Text("Måltider")
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.blue)
                Button("Notiser") {
                    isSheetShowing = true
                    
                    
                }
            }
            Text("Lägg till en ny måltid").foregroundColor(.black).padding(.bottom, 7)
            HStack {
                TextField("Titel", text: self.$newMeal)
                    .font(.system(size: 14))
                    .padding(12)
                
               
                TextField("Kcal", text: self.$newMealKcal).keyboardType(.numberPad)
                    .frame(width: 70)
                    .font(.system(size: 14))
                    .padding(12)
                    
            
            Button(action: self.addNewMeal, label: {
                Text("lägg till")
            })}
            HStack {
                Spacer()
                Text("Totala kalorier: \(calculateKcal())").padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)).font(.largeTitle).foregroundColor(.blue)
                Spacer()
            }
        }
        .sheet(isPresented: $isSheetShowing, content: {
            NotisSheet()
        })
    }
    
    func calculateKcal() -> String {
        var kcal = 0
        for i in mealStore.meals {
            kcal = kcal + i.kcal
        }
        return String(kcal)
    }
    
    func getData() {
        repository.getData() {data in
            mealStore.meals = data
        }
    }
    
    func addNewMeal() {
        if !newMeal.isEmpty {
            mealStore.meals.append(Meal(id: String(mealStore.meals.count + 1), title: newMeal, kcal: Int(newMealKcal) ?? 0))
                                
            repository.postData(data: mealStore.meals)
            newMeal = ""
            newMealKcal = ""
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.mealStore.meals) { meal in
                        HStack{
                            Text(meal.title)
                            Spacer()
                            Text(String(meal.kcal))
                        }
                    }.onMove(perform: self.move)
                    .onDelete(perform: self.delete)
                }.navigationBarItems(trailing: EditButton())
                
              
                .toolbar {
                                    ToolbarItem(placement: .navigationBarLeading) {
                                        Button("< Back", action: {
                                                                                    self
                                                                                        .presentationmMode
                                                                                        .wrappedValue
                                                                                        .dismiss()
                                                                                })

                                    }


                                }

            }
        }.onAppear {
            getData()
        }
        .navigationBarHidden(true)
    }
    
    func move(from source : IndexSet, to destination : Int) {
        mealStore.meals.move(fromOffsets: source, toOffset: destination)
        repository.postData(data: mealStore.meals)
    }
    
    func delete(at offsets : IndexSet) {
        mealStore.meals.remove(atOffsets: offsets)
        repository.postData(data: mealStore.meals)
    }
    
}



struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}
