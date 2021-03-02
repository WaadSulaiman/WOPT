
import Foundation
import Firebase
import FirebaseAuth


class MealRepository {
    private let firestore = Firestore.firestore()
    private let auth = Auth.auth()
    
    func postData(data: [Meal]) {
        if(auth.currentUser != nil) {
            firestore.collection("meals").document(auth.currentUser!.uid).updateData(["meals" : convertMealToArray(data: data)]) {
            err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        }
    }

    func getData(data: @escaping ([Meal]) -> Void ) {
        if(auth.currentUser != nil) {
            firestore.collection("meals").document(auth.currentUser!.uid).getDocument() {
                document, err in
                if let document = document {
                    if let arr = document.get("meals") as? Array<String>? {
                        data(self.convertArrayToMeal(data: arr))
                    } else {
                        data([Meal]())
                    }
                } else {
                    data([Meal]())
                }
            }
            
        } else {
            data([Meal]())
        }
    }
    
    private func convertArrayToMeal(data: Array<String>? ) -> [Meal] {
        var dataForReturn = [Meal]()
        var currentItem = 0
        if let data = data {
            for i in data {
                let itemArray = i.split(separator: "|")
                let meal = Meal(id: String(currentItem), title: String(itemArray[0]), kcal: Int(itemArray[1]) ?? 0)
                dataForReturn.append(meal)
                currentItem = currentItem + 1
            }
        }
        return dataForReturn
    }
    
    private func convertMealToArray(data: [Meal]) -> [String] {
        var dataForReturn = [String]()
        for i in data {
            dataForReturn.append("\(i.title)|\(i.kcal)")
        }
        return dataForReturn
    }
    
}

