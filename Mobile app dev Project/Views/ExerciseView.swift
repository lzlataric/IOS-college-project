//
//  ExerciseView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 08.12.2020..
//

import SwiftUI

struct ExerciseView: View {
    @ObservedObject var exercises = ExerciseDataViewModel()
    @ObservedObject var viewModel : ExerciseDataViewModel
    
    @State var caloriesBurned = 0
    @State var exerciseName = ""
    @State var shouldNavigate = false
    
    @Binding var exercise : [ExerciseData]
    
    @State var search: String = ""
    func getData(search: String) -> [ExerciseData] {
        
        let filtered = exercises.data.filter { (obj: ExerciseData) in
            obj.exerciseName.contains(search)
        }
        return filtered
    }
    
    
    var body: some View {
        TextField("Enter a word", text: $search)
        
        VStack {
            if (search == "") {
                List(exercises.data) { data in
                    //caloriesBurned = data.caloriesBurned
                    VStack(alignment: .leading) {
                        
                        HStack() {
                            Text(data.exerciseName)
                                .onTapGesture {
                                    self.caloriesBurned = data.caloriesBurned
                                    self.exerciseName = data.exerciseName
                                    self.shouldNavigate = true
                                    print(self.caloriesBurned)
                                }
                            
                            
                            
                            //   Text(String(data.caloriesBurned))
                            
                        }
                        //foregroundColor(isSelected)
                        
                        
                    }
                    
                }
                NavigationLink(destination: ExerciseDetailView(caloriesBurned: $caloriesBurned, exerciseName: $exerciseName, exercise: $exercise), isActive: $shouldNavigate) {
                    EmptyView()
                }
            } else {
                List(getData(search: search)) { data in
                    VStack(alignment: .leading) {
                        
                        Text(data.exerciseName)
                        Text(String(data.caloriesBurned))
                        
                    }
                    
                    
                }
            }
            
            
        }
    }
}

//struct ExerciseView_Previews: PreviewProvider {
//    static var previews: some View {
//        ExerciseView()
//    }
//}
