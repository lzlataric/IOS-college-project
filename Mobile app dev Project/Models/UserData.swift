//
//  UserData.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct UserData : Codable, Identifiable {
    var id: String
    var firstName: String
    var lastName: String
    var gender: String
    var height: String
    var weight: String
    var age: String
    var weightTarget: String
    //var currentWeight: String
}
