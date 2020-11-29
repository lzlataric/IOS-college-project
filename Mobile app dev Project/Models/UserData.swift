//
//  UserData.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct UserData : Identifiable {
    var id = UUID()
    var firstName: String
    var lastName: String
    var gender: String
    var height: Double
    var age: String
    var targetWeight: String
    var currentWeight: String
    var sleepTime: String
}
