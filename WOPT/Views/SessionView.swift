//
//  SessionView.swift
//  Created by Waad on 18/02/21.

import SwiftUI
import Combine

struct SessionView: View {
    @ObservedObject var exerciseStore = ExerciseStore()
    @State var newToDo : String = ""
    
    var searchBar : some View {
        HStack {
            TextField("Enter in a new exercise", text: self.$newToDo)
            Button(action: self.addNewToDo, label: {
                Text("Add New")
            })
        }
    }
    
    func addNewToDo() {
        exerciseStore.exercises.append(Exercise(id: String(exerciseStore.exercises.count + 1), toDoItem: newToDo))
        self.newToDo = ""
        //Add auto generated id in the future.
    }
    
    var body: some View {
        NavigationView {
            VStack {
                searchBar.padding()
                List {
                    ForEach(self.exerciseStore.exercises) { exercise in
                        Text(exercise.toDoItem)
                    }.onMove(perform: self.move)
                        .onDelete(perform: self.delete)
                }.navigationBarTitle("Monday")
                .navigationBarItems(trailing: EditButton())
            }
        }
    }
    func move(from source : IndexSet, to destination : Int) {
        exerciseStore.exercises.move(fromOffsets: source, toOffset: destination)
    }
    
    func delete(at offsets : IndexSet) {
        exerciseStore.exercises.remove(atOffsets: offsets)
    }
    
}

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView()
    }
}
