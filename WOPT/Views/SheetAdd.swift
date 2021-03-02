//
//  SheetAdd.swift
//  WOPT
//
//  Created by Elmir Abasov on 2021-03-02.
//

import SwiftUI

struct SheetAdd: View {
    private let repository = MealRepository()
    @Environment(\.presentationMode) var presentationMode
    @State private var mealTitle = ""
    @State private var mealKcal = ""
    var body: some View {
        
        NavigationView {
            
            VStack(alignment: .leading) {
                Text("Måltid").foregroundColor(.blue).font(
                    .largeTitle
                ).bold().padding(.bottom, 7)
                Text("Lägg till måltid och kalorier.")
                    .padding(.bottom, 10).padding(.bottom, 15)
                HStack(alignment: .top){
                    TextField("Titel", text: $mealTitle)
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color.black, lineWidth: 1)).font(.title)
                    TextField("Kcal", text: $mealKcal).keyboardType(.numberPad)
                        .background(RoundedRectangle(cornerRadius: 1).strokeBorder(Color.black, lineWidth: 1)).font(.title).frame(width: 90)
                    
                }
                Spacer()
            }.padding()
            .navigationBarItems(trailing:
                                    Button("Lägg till") {
                                        addItem()
                                    }
            )
            
        }
        
    }
    private func addItem() {
        if mealTitle.isEmpty && mealKcal.isEmpty {
            
        } else {
            repository.addMeal(Meal(
                                title: mealTitle,
                kcal: Int(mealKcal) ?? 0, completed: false
            ))
            presentationMode.wrappedValue.dismiss()
        }
    }
    
}



struct SheetAdd_Previews: PreviewProvider {
    static var previews: some View {
        SheetAdd()
    }
}
