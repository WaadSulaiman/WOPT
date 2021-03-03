//
//  SessionRepository.swift
//  WOPT
//
//  Created by Waad on 2021-02-24.
//

import Foundation
import Firebase
import FirebaseAuth


class SessionRepository {
    private let firestore = Firestore.firestore()
    private let auth = Auth.auth()
    private let user = "rqkOmRejNHQa1URlJr7dZm1Tru42"
    
    func postData(today: String, data: [Exercise]) {
        if(auth.currentUser != nil) {
            firestore.collection("workouts").document(auth.currentUser!.uid).setData([getCurrentDay(today: today): convertExerciseToArray(data: data)]) {
            err in
            if let err = err {
                print("Error updating document: \(err)")
            } else {
                print("Document successfully updated")
            }
        }
        }
    }

    func getData(today: String, data: @escaping ([Exercise]) -> Void ) {
        if(auth.currentUser != nil) {
            firestore.collection("workouts").document(auth.currentUser!.uid).getDocument() {
                document, err in
                if let document = document {
                    if let arr = document.get(self.getCurrentDay(today: today)) as? Array<String>? {
                        data(self.convertArrayToExercise(data: arr))
                        print(document.data())
                    } else {
                        data([Exercise]())
                        //print(document.data())
                    }
                } else {
                    data([Exercise]())
                }
            }
            
        } else {
            data([Exercise]())
        }
    }
    
    private func convertArrayToExercise(data: Array<String>? ) -> [Exercise] {
        var dataForReturn = [Exercise]()
        var currentItem = 0
        if let data = data {
            for i in data {
                print(i)
                dataForReturn.append(
                    Exercise(id: String(currentItem), toDoItem: String(i))
                )
                currentItem = currentItem + 1
            }
        }
        return dataForReturn
    }
    
    private func convertExerciseToArray(data: [Exercise]) -> [String] {
        var dataForReturn = [String]()
        for i in data {
            dataForReturn.append(i.toDoItem)
        }
        return dataForReturn
    }
    
    private func getCurrentDay(today: String) -> String {
        switch today {
        case "Måndag":
            return "monday"
        case "Tisdag":
            return "tuesday"
        case "Onsdag":
            return "wednesday"
        case "Torsdag":
            return "thursday"
        case "Fredag":
            return "friday"
        case "Lördag":
            return "saturday"
        default:
            return "sunday"
        }
    }
    
}

