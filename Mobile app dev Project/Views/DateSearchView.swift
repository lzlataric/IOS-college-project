//
//  HomePage.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 29/11/2020.
//

import SwiftUI
import FirebaseAuth
import SwiftUICharts

struct DateSearchView: View {
    @ObservedObject var viewModel : UserDataViewModel
    @ObservedObject var logViewModel : LogViewModel
    @Binding var choosenDate : Date
    
//    var sleep : Double = 0
//    var weight: Double = 0
//    var userId : String = ""
//    var currentDate = Date()
//    var breakfast: [FoodData] = [FoodData(name: "1", cal: 0, carbs: 0, fat: 0, protein: 0)]
//    var lunch: [FoodData] = [FoodData(name: "2", cal: 0, carbs: 0, fat: 0, protein: 0)]
//    var dinner: [FoodData] = [FoodData(name: "3", cal: 0, carbs: 0, fat: 0, protein: 0)]
//    var exercise: [ExerciseData] = [ExerciseData(exerciseName: "4", caloriesBurned: 0)]
    

    @State private var shouldNavigate = true
    
    //General UI properties
    let verticalPaddingForForm = 40.0
    
    //Graph UI propreties
    let chartStyle = ChartStyle(backgroundColor: Color.black, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd, textColor: Color.white, legendTextColor: Color.white, dropShadowColor: .black )
    
    
    var body: some View {
        
        
        ZStack {
            
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            VStack(spacing: CGFloat(verticalPaddingForForm)) {
                
                HStack {
                    
                    Text("<")
                        .padding(.leading)
                    Text("\(choosenDate)")
                        .padding()
                    Text(">")
                    Spacer()
                        .scaledToFit()
                    Text(viewModel.data.firstName)
                    Image(systemName: "person.fill")
                        .padding()
                }//HStack
                .padding(.top, 40)
                .frame(width: 380, height: 80, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(10)
                .background(Color(.black))
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.white)
                .zIndex(1)
                
                
                ScrollView {
                    
                    
                    VStack(spacing: CGFloat(verticalPaddingForForm)) {
                        
                        
                        HStack {
                            
                            PieChartView(data: [8,5,6], title: "Macro", style: chartStyle)
                                .padding()
                                .scaledToFit()
                            
                            VStack {
                                
                                HStack{
                                    Text("Carbs")
                                    Circle()
                                        .fill(Color.blue)
                                        .frame(width: 10.0, height: 10.0)
                                }
                                HStack{
                                    Text("Protein")
                                    Circle()
                                        .fill(Color.orange)
                                        .frame(width: 10.0, height: 10.0)
                                }
                                HStack{
                                    Text("Fat")
                                    Circle()
                                        .fill(Color.green)
                                        .frame(width: 10.0, height: 10.0)
                                }
                                
                            }//VStack
                            
                        }//HStack
                        .frame(width: 350, height: 300, alignment: .center)
                        .background(Color(.black))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        
                        HStack {
                            VStack {
                                Text("Your goal")
                                    .font(.system(size: 12))
                                Text(String(logViewModel.goalCalories))
                            }
                            Text("+")
                            VStack {
                                Text("Exercise")
                                    .font(.system(size: 12))
                                Text(String(logViewModel.caloriesBurnedWithExercise))
                            }
                            Text("-")
                                .padding(.top)
                            VStack {
                                Text("Calories Eaten")
                                    .font(.system(size: 12))
                                Text(String(logViewModel.calorieIntake))
                            }
                            Text("=")
                            VStack {
                                Text("Calories left")
                                    .font(.system(size: 12))
                                if(logViewModel.caloriesLeft < 0) {
                                    Text(String(logViewModel.caloriesLeft))
                                        .foregroundColor(Color(.red))
                                } else {
                                    Text(String(logViewModel.caloriesLeft))
                                        .foregroundColor(Color(.green))
                                }
                            }
                            
                            
                        }//HStack
                        .frame(width: 350, height: 100, alignment: .center)
                        .background(Color(.black))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        
                        
                        
                        
                        HStack{
                            
                            VStack{
                                
                                HStack {
                                    Text("Breakfast")
                                        .padding()
                                    
                                    Spacer()
                                        .frame(width: 200)
                                    
                                }//HStack
                                .font(.system(size: 12))
                                
                                Spacer()
                                
                                
                                
                                // Text(logViewModel.data.first?.breakfast.first?.name ?? "no data")
                                
                                VStack {
                                    ForEach(logViewModel.data) { data in
                                        ForEach(data.breakfast) { breakfast in
                                            //Text(String(describing: data.actualDate))
                                            HStack {
                                                VStack {
                                                    Text(breakfast.name)
                                                }//VStack
                                                .frame(alignment: .leading)
                                                Spacer()
                                                    .frame(width: 30)
                                                VStack {
                                                    Text(String(breakfast.cal))
                                                }//VStack
                                                .frame(alignment: .leading)
                                            }//HStack
                                            
                                        }
                                    }
                                }//VStack
                                .scaledToFit()
                                .padding(.bottom)
                                .frame(alignment: .leading)
                                
                            }//VStack
                            
                            
                        }//HStack
                        .frame(width: 350, alignment: .leading)
                        .background(Color(.black))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        
                        
                        HStack{
                            
                            VStack{
                                
                                HStack {
                                    Text("Lunch")
                                        .padding()
                                    
                                }//HStack
                                .font(.system(size: 12))
                                
                                Spacer()
                                
                                    VStack {
                                        ForEach(logViewModel.data) { data in
                                            ForEach(data.lunch) { lunch in
                                                //Text(String(describing: data.actualDate))
                                                HStack {
                                                    VStack {
                                                        Text(lunch.name)
                                                    }//VStack
                                                    .frame(alignment: .leading)
                                                    Spacer()
                                                        .frame(width: 30)
                                                    VStack {
                                                        Text(String(lunch.cal))
                                                    }//VStack
                                                    .frame(alignment: .leading)
                                                }//HStack
                                                
                                            }
                                        }
                                    }//VStack
 
                            }//VStack
                            
                            
                        }//HStack
                        .frame(width: 350, height: 100, alignment: .center)
                        .background(Color(.black))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        
                        
                        HStack{
                            
                            VStack{
                                
                                HStack {
                                    Text("Dinner")
                                        .padding()
                                }//HStack
                                .font(.system(size: 12))
                                
                                Spacer()
                                
                                VStack {
                                    ForEach(logViewModel.data) { data in
                                        ForEach(data.dinner) { dinner in
                                            //Text(String(describing: data.actualDate))
                                            HStack {
                                                VStack {
                                                    Text(dinner.name)
                                                }//VStack
                                                .frame(alignment: .leading)
                                                Spacer()
                                                    .frame(width: 30)
                                                VStack {
                                                    Text(String(dinner.cal))
                                                }//VStack
                                                .frame(alignment: .leading)
                                            }//HStack
                                            
                                        }
                                    }
                                }//VStack
                                
                                
                                
                            }//VStack
                            
                            
                        }//HStack
                        .frame(width: 350, height: 100, alignment: .center)
                        .background(Color(.black))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        
                        
                        HStack{
                            
                            VStack{
                                
                                HStack {
                                    Text("Exercise")
                                        .padding()
                                }//HStack
                                .font(.system(size: 12))
                                
                                Spacer()
                                
                                VStack {
                                    ForEach(logViewModel.data) { data in
                                        ForEach(data.exercise) { exercise in
                                            //Text(String(describing: data.actualDate))
                                            HStack {
                                                VStack {
                                                    Text(exercise.exerciseName)
                                                }//VStack
                                                .frame(alignment: .leading)
                                                Spacer()
                                                    .frame(width: 30)
                                                VStack {
                                                    Text(String(exercise.caloriesBurned))
                                                }//VStack
                                                .frame(alignment: .leading)
                                            }//HStack
                                            
                                        }
                                    }
                                }//VStack
                                
                            }//VStack
                            
                            
                        }//HStack
                        .frame(width: 350, height: 100, alignment: .center)
                        .background(Color(.black))
                        .cornerRadius(15)
                        .foregroundColor(.white)
                        
                        
                        
                    }//VStack
                    
                }//ScroolView
                
                
            }//VStack
            
            
        }//ZStack
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            viewModel.getUserInputData()
            print(choosenDate)
            logViewModel.getAllLogsByDate(searchedDate: choosenDate)
        }
        
    }//some View
    
}//View

struct DateSearchView_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(viewModel: UserDataViewModel(data: UserData(id: "0", firstName: "test", lastName: "test", gender: "test", height: "test", weight: "test", age: "test", weightTarget: "test")), logViewModel: LogViewModel())
    }
}
