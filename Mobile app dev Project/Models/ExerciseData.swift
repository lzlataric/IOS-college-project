//
//  ExerciseData.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct ExerciseData: Identifiable, Codable, Equatable, Hashable {
    
    var id = UUID()
    var exerciseName: String
    var caloriesBurned: Int
    
    enum CodingKeys: CodingKey{
        case exerciseName
        case caloriesBurned
    }
}
