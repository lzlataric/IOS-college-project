//
//  FoodData.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation


struct FooDData: Identifiable {
    var id: ObjectIdentifier
    
    let foodId = UUID()
    let name: String
    let calories: Int
    let carbs: Int
    let protein: Int
}
