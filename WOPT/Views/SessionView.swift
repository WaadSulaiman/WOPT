//
//  SessionView.swift
//  Created by Waad on 18/02/21.

import SwiftUI
import Combine

struct SessionView: View {
    private let repository = SessionRepository()
    @ObservedObject var exerciseStore = ExerciseStore()
    @State var newToDo : String = ""
    var today: String
    
    var searchBar : some View {
        HStack {
            TextField("Lägg till en ny övning", text: self.$newToDo)
            Button(action: self.addNewToDo, label: {
                Text("lägg till")
            })
        }
    }
    
    func getData() {
        repository.getData(today: today) {data in
            print("data \(data)")
            exerciseStore.exercises = data
        }
    }
    
    func addNewToDo() {
        exerciseStore.exercises.append(Exercise(id: String(exerciseStore.exercises.count + 1), toDoItem: newToDo))
        self.newToDo = ""
        //Add auto generated id in the future.
        repository.postData(today: today, data: exerciseStore.exercises)
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
                }.navigationBarTitle(today)
                .navigationBarItems(trailing: EditButton())
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

struct SessionView_Previews: PreviewProvider {
    static var previews: some View {
        SessionView(today: "")
    }
}
