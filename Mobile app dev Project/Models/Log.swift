//
//  FoodLog.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct Log: Identifiable {
//    var foodData : FoodData
//    // let id = UUID()
    let id = UUID()
    var userId : String
    var currentDate = NSObject()
    var breakfast : [FoodData]
    var lunch : [FoodData]
    var dinner : [FoodData]
    var sleep : Double
    var exercise : [ExerciseData]
    var weight : Double
}
