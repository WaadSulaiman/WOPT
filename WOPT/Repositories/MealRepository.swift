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
        db.collection("meals").addSnapshotListener { (querySnapshot, error) in
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
    
    func addMeal(_ meal: Meal) {
        do {
            let _ = try db.collection("meals").addDocument(from: meals)
        }
        catch {
            fatalError("Unable to encode meals: \(error.localizedDescription)")
        }
    }

}
