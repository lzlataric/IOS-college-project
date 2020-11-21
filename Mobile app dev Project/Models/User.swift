//
//  User.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct User: Identifiable {
    let id = UUID()
    let password : String
    let name : String
    let lastname : String
    let email : String
}
