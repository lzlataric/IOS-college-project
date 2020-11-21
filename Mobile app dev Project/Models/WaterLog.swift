//
//  WaterLog.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct WaterLog: Identifiable {
    let id = UUID()
    let waterConsumption: Double
    let currentDate = Date()
}
