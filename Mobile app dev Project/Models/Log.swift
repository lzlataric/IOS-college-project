//
//  FoodLog.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation
import FirebaseFirestore
import CodableFirebase
typealias FirebaseDecoder = FirestoreDecoder
extension DocumentReference: DocumentReferenceType {}
extension GeoPoint: GeoPointType {}
extension FieldValue: FieldValueType {}
extension Timestamp: TimestampType {}

struct Log: Identifiable, Codable {
//    var foodData : FoodData
//    // let id = UUID()
    let id = UUID()
    var userId : String
    var currentDate : Timestamp
    var breakfast : [FoodData]
    var lunch : [FoodData]
    var dinner : [FoodData]
    var sleep : Double
    var exercise : [ExerciseData]
    var weight : Double
    var actualDate : Date {
        currentDate.dateValue()
    }
    
    enum CodingKeys: CodingKey{
        case userId
        case currentDate
        case breakfast
        case lunch
        case dinner
        case sleep
        case exercise
        case weight
    }
}
