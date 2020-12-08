//
//  FoodDataViewModel.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 07.12.2020..
//
import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

final class ExerciseDataViewModel: ObservableObject {
    //@Published var foodOne  : FoodData
    @Published private(set) var data = [ExerciseData]()
    
    init() {
        //self.foodOne = foodData
        getAllExercise()
    }
    
    func getAllExercise() {
        
        Firestore.firestore()
            .collection("Exercise_Data")
            .getDocuments { (arg,err)  in
                if let err = err {
                    print("Error writing document: \(err)")
                } else if let querysnaphot = arg {
                    
                    for document in querysnaphot.documents{
                        
                        let response = document.data()
                        
                        guard let name = response["exerciseName"] as? String,
                              let cal = response["caloriesBurned"] as? Int
                        else {
                            continue
                        }
                        let exercise = ExerciseData(exerciseName: name, caloriesBurned: cal)
                        
                        self.data.append(exercise)
                        
                    }
                    
                }
                
                
            }//getDocument
    }//func getUserInputData
    
}//class
