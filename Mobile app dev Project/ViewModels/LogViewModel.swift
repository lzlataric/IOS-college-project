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
    //@Published var foodOne  : FoodData
    @Published private(set) var data = [Log]()
    
    init() {
        getAllLogs()
    }
    
    func getAllLogs() {
        
        Firestore.firestore()
            .collection("Log")
            .getDocuments { (arg,err)  in
                if let err = err {
                    print("Error writing document: \(err)")
                } else if let querysnaphot = arg {
                    
                    for document in querysnaphot.documents{
                        
                        let response = document.data()
                        
                        guard
                            
                              let userId = response["userId"] as? String,
                              let breakfast = response["breakfast"] as? [FoodData],
                              let currentDate = response["currentDate"] as? NSObject,
                              let lunch = response["lunch"] as? [FoodData],
                              let dinner = response["dinner"] as? [FoodData],
                              let sleep = response["sleep"] as? Double,
                              let exercise = response["exercise"] as? [ExerciseData],
                              let weight = response["weight"] as? Double
                        else {
                            
                            continue
                        }
                        let log = Log(userId: userId, breakfast: breakfast, lunch: lunch, dinner: dinner, sleep: sleep, exercise: exercise, weight: weight)
                        self.data.append(log)
                        
                        
                        
                        
                    }
                    
                }
                
                
            }//getDocument
    }//func getUserInputData
    
}//class
