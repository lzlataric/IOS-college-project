//
//  UserData.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct UserData : Identifiable {
    let id = UUID()
    let gender: Int
    let height: Double
    let age: Int
    let targetWeight: Double
    let currentWeight: Double
    let sleepTime: Double
}
