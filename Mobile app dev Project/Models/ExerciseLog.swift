//
//  ExerciseLog.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation

struct ExerciseLog: Identifiable {
    let id = UUID()
    let idExercise : Int
    let minutes : Int
}
