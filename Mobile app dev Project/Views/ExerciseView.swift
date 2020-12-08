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
                                VStack(alignment: .leading) {
                                    // 3.
                                    HStack() {
                                        Text(data.exerciseName)
                                        Text(String(data.caloriesBurned))
                                    }
                                }
                        }
                    } else {
                        List(getData(search: search)) { data in
                                VStack(alignment: .leading) {
                                    // 3.
                                    Text(data.exerciseName)
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
