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
    
    @Environment(\.presentationMode) private var presentationMode : Binding<PresentationMode>
    
    @Binding var exercise : [ExerciseData]
    
    func calculateQuantity(quantity: String) {
        let final = caloriesBurned * Int(quantity)!
        let exerciseFinal = ExerciseData(exerciseName: self.exerciseName, caloriesBurned: final)
        exercise.append(exerciseFinal)
    }
    
    
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            
            VStack {
                
                Text("Enter the exercise time")
                    .font(Font.title2.weight(.heavy))
                    .foregroundColor(Color(.white))
                    .padding(.bottom)
                    .shadow(radius: 10)
                
                TextField("Number of minutes",text: $quantity)
                    .keyboardType(.numberPad)
                    .frame(width: 300, height: 40, alignment: .center)
                    .autocapitalization(.none)
                    .background(Color.white)
                    .opacity(0.8)
                    .shadow(radius: 10)
                    .cornerRadius(13)
                    .padding()
                    .multilineTextAlignment(.center)
                
                Button(action: {
                    calculateQuantity(quantity: quantity)
                    self.presentationMode.wrappedValue.dismiss()
                }) {
                    Text("Add")
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 50)
                }
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                .shadow(radius: 10)
                
            }//VStack
            .cornerRadius(15)
            .shadow(radius: 10)
            
        }//ZStack
        .edgesIgnoringSafeArea(.all)
        
    }//some View
}//View

//struct ExerciseDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseDetailView()
//    }
//}
