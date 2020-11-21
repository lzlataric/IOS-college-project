//
//  WeightLog.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct WeightLog: Identifiable {
    let id = UUID()
    let currentWeight: Double
    let currentDate = Date()
}
