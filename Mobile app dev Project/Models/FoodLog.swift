//
//  FoodLog.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct FoodLog: Identifiable {
    let id = UUID()
    let foodID: Int
    let currentDate = Date()
    let numbOfservings: Double
    let meal: Int
}
