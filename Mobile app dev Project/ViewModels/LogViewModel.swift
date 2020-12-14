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
    @Published private(set) var data = [Log]()
    @Published private(set) var weightData = [Double]()
        
    @Published private(set) var caloriesLeft : Double = 0
    @Published private(set) var calorieIntake : Double = 0
    @Published private(set) var caloriesBurnedWithExercise : Double = 0
    @Published private(set) var goalCalories : Double = 2500

    
    
    @Published private var date = Timestamp(date: Date())
    let dateFormatter = DateFormatter()
    
    
    func getAllLogsByDate(searchedDate: Date) {
        
        self.data = []
        
        Firestore.firestore()
            .collection("Log")
            .getDocuments { (arg,err)  in
                if let err = err {
                    print("Error writing document: \(err)")
                } else if let querysnaphot = arg {
                    for document in querysnaphot.documents{
                        let user = Auth.auth().currentUser?.uid
                        let response = document.data()
                        do {
                            let log = try FirebaseDecoder().decode(Log.self, from: response)
                            
                            self.dateFormatter.dateFormat = "yyyy-MM-dd" 
                            let actualDate = self.dateFormatter.string(from: log.actualDate)
                            let searchedDate = self.dateFormatter.string(from: searchedDate)
                            
                            if(actualDate == searchedDate && user == log.userId){
                                DispatchQueue.main.async {
                                    self.data.append(log)
                                    
                                    for food in log.breakfast {
                                        self.calorieIntake = self.calorieIntake + food.cal
                                    }
                                    for food in log.lunch {
                                        self.calorieIntake = self.calorieIntake + food.cal
                                    }
                                    for food in log.dinner {
                                        self.calorieIntake = self.calorieIntake + food.cal
                                    }
                                    
                                    for exercise in log.exercise {
                                        self.caloriesBurnedWithExercise = self.caloriesBurnedWithExercise + Double(exercise.caloriesBurned)
                                    }
                                    print(self.caloriesBurnedWithExercise)
                                    
                                    self.caloriesLeft = self.goalCalories - self.calorieIntake + self.caloriesBurnedWithExercise
                                    print(self.caloriesLeft)
                                                                      
                                }
                                
                            }
                            
                        } catch {
                            print(error)
                        }
                          
                    }
                    
                }
                
            }//getDocument
    }//func getUserInputData
    
    
    func getAllWeightLogs() {
        
        self.weightData = []
        
        Firestore.firestore()
            .collection("Log")
            .getDocuments { (arg,err)  in
                if let err = err {
                    print("Error writing document: \(err)")
                } else if let querysnaphot = arg {
                    for document in querysnaphot.documents{
                        let user = Auth.auth().currentUser?.uid
                        let response = document.data()
                        do {
                            let log = try FirebaseDecoder().decode(Log.self, from: response)
   
                            if(user == log.userId) {
                                DispatchQueue.main.async {

                                self.weightData.append(log.weight)
                                print(user)
                                print(log.userId)
                                print(self.weightData)
                                }
                            }
                            
                        } catch {
                            print(error)
                        }
                          
                    }
                    
                }
                
            }//getDocument
    }//func getUserInputData
    
    
    func storeLogData(userId: String, breakfast: [FoodData], dinner: [FoodData], lunch: [FoodData], exercise: [ExerciseData], sleep: Double, weight: Double, water: Double) {
        
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
                "weight": weight,
                "water": water
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
