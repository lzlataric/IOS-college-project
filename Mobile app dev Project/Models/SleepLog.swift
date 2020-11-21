//
//  SleepLog.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct SleepLog: Identifiable {
    let id = UUID()
    let sleepTime: Double
    let currentDate = Date()
}
