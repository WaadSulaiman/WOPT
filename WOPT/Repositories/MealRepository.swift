//
//  MealRepository.swift
//  WOPT
//
//  Created by Waad on 2021-02-24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class MealRepository: ObservableObject {

    let db = Firestore.firestore()

    @Published var meals = [Meal]()
    
    init() {
        loadData()
    }

    func loadData() {
        db.collection("meals")
            .order(by: "createdTime")
            .addSnapshotListener { (querySnapshot, error) in
            if let querySnapshot = querySnapshot {
                self.meals = querySnapshot.documents.compactMap { document in
                    do {
                  let x = try document.data(as: Meal.self)
                        return x
                    }
                    catch {
                        print(error)
                    }
                    return nil
            }

        }
    }
}
    
    func addMeal(_ meals: Meal) {
        do {
            let _ = try db.collection("meals").addDocument(from: meals)
        }
        catch {
            fatalError("Unable to encode meals: \(error.localizedDescription)")
        }
    }
    func updateMeal(_ meals: Meal) {
        if let mealID = meals.id {
            do {
                
          try  db.collection("meals").document(mealID).setData(from: meals)
            }
            catch{
                fatalError("Unable to encode meals: \(error.localizedDescription)")
            }
    }

}

}
