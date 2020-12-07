//
//  FoodData.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation


struct FoodData: Identifiable, Codable, Equatable {
    
    var id = UUID()
    var name: String
    var cal: Double
    var carbs: Double
    var fat: Double
    var protein: Double
}
