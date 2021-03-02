//
//  SessionView.swift
//  Created by Waad on 18/02/21.

import SwiftUI
import Combine

struct MealListView: View {
    private let repository = MealRepository()
    
    func getData() {
        repository.getData(today: today) {data in
            print("data \(data)")
            exerciseStore.exercises = data
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(self.exerciseStore.exercises) { exercise in
                        Text(exercise.toDoItem)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }.navigationBarItems(trailing: EditButton())
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button("Add") {
                            
                        }
                    }
                }
            }
        }.onAppear {
            getData()
        }
    }

    func move(from source : IndexSet, to destination : Int) {
        exerciseStore.exercises.move(fromOffsets: source, toOffset: destination)
        repository.postData(today: today, data: exerciseStore.exercises)
    }
    
    func delete(at offsets : IndexSet) {
        exerciseStore.exercises.remove(atOffsets: offsets)
        repository.postData(today: today, data: exerciseStore.exercises)
    }
    
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        MealListView()
    }
}

