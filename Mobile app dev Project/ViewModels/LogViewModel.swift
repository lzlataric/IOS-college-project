//
//  LogViewModel.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 08.12.2020..
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

final class LogViewModel: ObservableObject {
//    @Published private(set) var emptyLogData : [Log] = [Log(userId: "", currentDate: Timestamp(), breakfast: [FoodData(name: "", cal: 0, carbs: 0, fat: 0, protein: 0)], lunch: [FoodData(name: "", cal: 0, carbs: 0, fat: 0, protein: 0)], dinner: [FoodData(name: "", cal: 0, carbs: 0, fat: 0, protein: 0)], sleep: 0, exercise: [ExerciseData(exerciseName: "", caloriesBurned: 0)], weight: 0)]
    @Published private(set) var data = [Log]()
    @Published private var date = Timestamp(date: Date())
    let dateFormatter = DateFormatter()
    
    
    init() {
    }
    
    func getAllLogs() {
        
        self.data = []
        
        Firestore.firestore()
            .collection("Log")
            .getDocuments { (arg,err)  in
                if let err = err {
                    print("Error writing document: \(err)")
                } else if let querysnaphot = arg {
                    for document in querysnaphot.documents{
                        //let date = postTimestamp.dateValue()
                        let user = Auth.auth().currentUser?.uid
                        let response = document.data()
                        do {
                            let log = try FirebaseDecoder().decode(Log.self, from: response)
                            
                            self.dateFormatter.dateFormat = "yyyy-MM-dd" 
                            let actualDate = self.dateFormatter.string(from: log.actualDate)
                            let todaysDate = self.dateFormatter.string(from: Date())
                            print(actualDate)
                            
                            //print(user?.uid)
                            print(log.userId)
                            //if(actualDate == todaysDate && user == log.userId){
                            if(actualDate == todaysDate){
                                DispatchQueue.main.async {
                                    self.data.append(log)
                                    //print(self.data)
                                }
                                
                            }
                            
                        } catch {
                            print(error)
                        }
                        
                        

                        
                        
                    }
                    
                }
                
                
            }//getDocument
    }//func getUserInputData
    
//    func storeLogData() {
//
//        Firestore.firestore()
//            .collection("Log")
//            .document("6")
//            .setData([
//                "userId": "2",
//                "currentDate": Timestamp(date: Date()),
//                "breakfast": [
//                    [
//                        "name": "povrce",
//                        "cal" :  5.0,
//                        "carbs" : 5.0,
//                        "fat" : 5.0,
//                        "protein" : 6
//                    ]
//                ],
//                "lunch": [
//                    [
//                        "name": "name2",
//                        "cal" :  5.0,
//                        "carbs" : 5.0,
//                        "fat" : 5.0,
//                        "protein" : 6
//                    ]
//                ],
//                "dinner": [
//                    [
//                        "name": "name3",
//                        "cal" :  5.0,
//                        "carbs" : 5.0,
//                        "fat" : 5.0,
//                        "protein" : 6
//                    ]
//                ],
//                "exercise": [
//                    [
//                        "exerciseName": "name1",
//                        "caloriesBurned": 90
//                    ]
//                ],
//                "sleep": 8,
//                "weight": 87
//            ]) { err in
//                if let err = err {
//                    print("Error writing document: \(err)")
//                } else {
//                    print("Document successfully written!")
//                }
//            }
//    }//storeLogData
    
    func storeLogData(userId: String, breakfast: [FoodData], dinner: [FoodData], lunch: [FoodData], exercise: [ExerciseData], sleep: Double, weight: Double) {
        
        self.dateFormatter.dateFormat = "yyyy-MM-dd"
        let todaysDate = self.dateFormatter.string(from: Date())
        print(breakfast)
        
        var finalBreakfast = [Any]()
        var finalDinner = [Any]()
        var finalLunch = [Any]()
        var finalExercise = [Any]()

        
        for food in breakfast {
            do {
                let jsonData = try JSONEncoder().encode(food)
                let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                finalBreakfast.append(jsonObject)
            } catch {
                    print(error)
            }
        }
        
        for food in lunch {
            do {
                let jsonData = try JSONEncoder().encode(food)
                let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                finalLunch.append(jsonObject)
            } catch {
                    print(error)
            }
        }
        
        for food in dinner {
            do {
                let jsonData = try JSONEncoder().encode(food)
                let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                finalDinner.append(jsonObject)
            } catch {
                    print(error)
            }
        }
        
        for exer in exercise {
            do {
                let jsonData = try JSONEncoder().encode(exer)
                let jsonObject = try JSONSerialization.jsonObject(with: jsonData, options: [])
                finalExercise.append(jsonObject)
            } catch {
                    print(error)
            }
        }
        
        
            Firestore.firestore()
                .collection("Log")
                .addDocument(data: [
                    "userId" : userId,
                    "breakfast": finalBreakfast,
                    "dinner": finalDinner,
                    "lunch": finalLunch,
                    "currentDate": Date(),
                    "exercise": finalExercise,
                    "sleep": sleep,
                    "weight": weight
                ]) { err in
                    if let err = err {
                        print("Error writing document: \(err)")
                    } else {
                        print("Document successfully written!")
                    }
                }
        }//storeLogData
    
    
}//class
//userId: String, currentLogDate: Date, breakfast: [FoodData], lunch: [FoodData], dinner: [FoodData], sleep: Double, exercise: [ExerciseData], weight: Double, documentId: String
