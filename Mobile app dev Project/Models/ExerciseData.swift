//
//  ExerciseData.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct ExerciseData: Identifiable {
    var id: ObjectIdentifier
    
    let exerciseId = UUID()
    let exerciseName: String
    let caloriesBurned: Int
}
