//
//  ExerciseView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 08.12.2020..
//

import SwiftUI

struct ExerciseView: View {
    @ObservedObject var viewModel : ExerciseDataViewModel
    
    @State var caloriesBurned = 0
    @State var exerciseName = ""
    @State var shouldNavigate = false
    
    @Binding var exerciseList : [ExerciseData]
    
    //Search key-word functionality
    @State var search: String = ""
    func getData(search: String) -> [ExerciseData] {
        
        let filtered = viewModel.data.filter { (obj: ExerciseData) in
            obj.exerciseName.contains(search)
        }
        return filtered
    }
    
    
    var body: some View {
        
        
        
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            
            VStack {
                
                Text("Choose an exercise")
                    .font(Font.title2.weight(.heavy))
                    .foregroundColor(Color(.white))
                    .padding(.bottom)
                    .shadow(radius: 10)
                    .multilineTextAlignment(.center)
                
                Image("exercise")
                    .resizable()
                    .frame(width: 100, height: 90, alignment: .center)
                    .shadow(radius: 10)
                
                TextField("Enter a exercise", text: $search)
                    .frame(width: 300, height: 40, alignment: .center)
                    .autocapitalization(.none)
                    .background(Color.white)
                    .opacity(0.8)
                    .shadow(radius: 10)
                    .cornerRadius(13)
                    .padding()
                    .multilineTextAlignment(.center)
                
                
                if (search == "") {
                       
                    List(viewModel.data) { data in
                        VStack(alignment: .center) {
                            
                            Text(data.exerciseName)
                                .onTapGesture {
                                    self.caloriesBurned = data.caloriesBurned
                                    self.exerciseName = data.exerciseName
                                    self.shouldNavigate = true
                                    print(self.caloriesBurned)
                                }
                            
                        }//VStack
                        
                    }//List
                    .frame(width: 300, height: 400)
                    .opacity(0.8)
                    .shadow(radius: 10)
                    .cornerRadius(13)
                    
                    NavigationLink(destination: ExerciseDetailView(caloriesBurned: $caloriesBurned, exerciseName: $exerciseName, exercise: $exerciseList), isActive: $shouldNavigate) {
                        EmptyView()
                    }
                    
                } else {
                    List(getData(search: search)) { data in
                        VStack(alignment: .center) {
                            
                            Text(data.exerciseName)
                                .onTapGesture {
                                    self.caloriesBurned = data.caloriesBurned
                                    self.exerciseName = data.exerciseName
                                    self.shouldNavigate = true
                                    print(self.caloriesBurned)
                                }
                            
                        }//VStack
                        
                    }//List
                    .frame(width: 300, height: 400)
                    .opacity(0.8)
                    .shadow(radius: 10)
                    .cornerRadius(13)
                    
                    NavigationLink(destination: ExerciseDetailView(caloriesBurned: $caloriesBurned, exerciseName: $exerciseName, exercise: $exerciseList), isActive: $shouldNavigate) {
                        EmptyView()
                    }

                }
                
                
            }//VStack
            .cornerRadius(15)
            .opacity(0.8)
            .shadow(radius: 10)
            
        }//ZStack
        .edgesIgnoringSafeArea(.all)
        
    }//some View
    
}//View

struct ExerciseView_Previews: PreviewProvider {
    @State static var exercise = [ExerciseData(exerciseName: "Test", caloriesBurned: 50)]
    
    static var previews: some View {
        ExerciseView(viewModel: ExerciseDataViewModel(), exerciseList: $exercise)
    }
}
