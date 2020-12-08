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

final class FoodDataViewModel: ObservableObject {
    //@Published var foodOne  : FoodData
    @Published private(set) var data = [FoodData]()
    
    init(foodData: FoodData) {
        //self.foodOne = foodData
        getAllFood()
    }
    
    func getAllFood() {
        
        Firestore.firestore()
            .collection("Food_Data")
            .getDocuments { (arg,err)  in
                if let err = err {
                    print("Error writing document: \(err)")
                } else if let querysnaphot = arg {
                    
                    for document in querysnaphot.documents{
                        
                        let response = document.data()
                        
                        guard let name = response["name"] as? String,
                              let cal = response["cal"] as? Double,
                              let carbs = response["carbs"] as? Double,
                              let fat = response["fat"] as? Double,
                              let protein = response["protein"] as? Double
                        else {
                            continue
                        }
                        let food = FoodData(name: name, cal: cal, carbs: carbs, fat: fat, protein: protein)
                        
                        self.data.append(food)
                        
                    }
                    
                }
                
                
            }//getDocument
    }//func getUserInputData
    
}//class
