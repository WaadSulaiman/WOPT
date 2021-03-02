//
//  SessionView.swift
//  Created by Waad on 18/02/21.

import SwiftUI
import Combine

struct MealListView: View {
    private let repository = MealRepository()
    @ObservedObject var mealStore = MealStore()
    @State var newMeal: String = ""
    @State var newMealKcal: String = ""
    private var totalKcal = 0
    
    var searchBar : some View {
        VStack(alignment: .leading){
            Text("Lägg till en ny måltid").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/).padding(.bottom, 7)
            HStack {
                TextField("titel", text: self.$newMeal)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5) .strokeBorder(Color.gray,lineWidth: 1))
                TextField("kalorier", text: self.$newMealKcal).keyboardType(.numberPad)
                    .frame(width: 70)
                    .font(.system(size: 14))
                    .padding(12)
                    .background(RoundedRectangle(cornerRadius: 5) .strokeBorder(Color.gray,lineWidth: 1))
            
            Button(action: self.addNewMeal, label: {
                Text("lägg till")
            })}
            HStack {
                Spacer()
                Text("total kalorier: \(calculateKcal())").bold().padding(EdgeInsets(top: 20, leading: 0, bottom: 10, trailing: 0)).font(.title)
                Spacer()
            }
        }
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
                }.navigationBarItems(trailing: EditButton()).navigationBarBackButtonHidden(true)

            }
        }.onAppear {
            getData()
        }
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
