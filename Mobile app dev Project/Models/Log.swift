//
//  FoodLog.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct Log: Identifiable {
    // let id = UUID()
    let id : String
    let currentDate : Date()
    var breakfast : [FoodData]
    var lunch: [FoodData]
    var dinner :[FoodData]
    var sleep : Double
    var exercice : [ExerciseData]
    var weight : Double
}
