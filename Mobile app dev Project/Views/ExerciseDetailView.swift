//
//  ExerciseDetailView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 12.12.2020..
//

import SwiftUI

struct ExerciseDetailView: View {
    @Binding var caloriesBurned : Int
    @Binding var exerciseName : String
    
    @State var quantity = ""
    
    @Binding var exercise : [ExerciseData]
    
    func calculateQuantity(quantity: String) {
        let final = caloriesBurned * Int(quantity)!
        let exerciseFinal = ExerciseData(exerciseName: self.exerciseName, caloriesBurned: final)
        exercise.append(exerciseFinal)
    }
    
    
    var body: some View {
        
        TextField("Enter exercise time", text: $quantity)
        
        Button(action: {
            calculateQuantity(quantity: quantity)
        }) {
            Text("add food")
        }
    }
}

//struct ExerciseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetailView()
//    }
//}
