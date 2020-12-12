//
//  HomePage.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 29/11/2020.
//

import SwiftUI
import FirebaseAuth
import SwiftUICharts

struct HomePage: View {
    @ObservedObject var viewModel : UserDataViewModel
    @ObservedObject var logViewModel : LogViewModel

    @State var sleep : Double = 0
    @State var weight: Double = 0
    @State var userId : String = ""
    @State var currentDate = Date()
    // var breakfast: [FoodData] = [FoodData(name: "1", cal: 0, carbs: 0, fat: 0, protein: 0)]
    @State var breakfast: [FoodData] = []
    // var lunch: [FoodData] = [FoodData(name: "2", cal: 0, carbs: 0, fat: 0, protein: 0)]
    @State var lunch: [FoodData] = []
    //var dinner: [FoodData] = [FoodData(name: "3", cal: 0, carbs: 0, fat: 0, protein: 0)]
    @State var dinner: [FoodData] = []
    // var exercise: [ExerciseData] = [ExerciseData(exerciseName: "4", caloriesBurned: 0)]
    @State var exercise: [ExerciseData] = []
    
    let user = Auth.auth().currentUser
    
    var todaysDate = "Fri, 9 Oct"
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
                    Text(todaysDate)
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
                                    Text("1500")
                                }
                                Text("+")
                                VStack {
                                    Text("Exercise")
                                        .font(.system(size: 12))
                                    Text("0")
                                }
                                Text("-")
                                    .padding(.top)
                                VStack {
                                    Text("Calories Eaten")
                                        .font(.system(size: 12))
                                    Text("350")
                                }
                                Text("=")
                                VStack {
                                    Text("Calories left")
                                        .font(.system(size: 12))
                                    Text("1150")
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
                                        
                                        NavigationLink(destination:FoodView(viewModel: FoodDataViewModel(foodData: FoodData(name: "test", cal: 0.0, carbs: 0.0, fat: 0.0, protein: 0.0)), breakfast: $breakfast)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                        }//NavigationLink
                                        .background(Color(.black))
                                        .padding()
                                        
                                    }//HStack
                                    .font(.system(size: 12))
                                    
                                    Spacer()
                                    
                                 
                            
                                   // Text(logViewModel.data.first?.breakfast.first?.name ?? "no data")
                                    
                                    VStack {
                                        ForEach(breakfast) { food in
                                            HStack {
                                                VStack {
                                                    Text(food.name )
                                                }//VStack
                                                .frame(alignment: .leading)
                                                Spacer()
                                                    .frame(width: 30)
                                                VStack {
                                                    Text(String(food.cal) )
                                                }//VStack
                                                .frame(alignment: .leading)
                                                
                                                Text("-")
                                                    .onLongPressGesture {
                                                        breakfast.remove(at: 0)
                                                    }
                                                
                                            }//HStack
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
                                        
                                        NavigationLink(destination:FoodView(viewModel: FoodDataViewModel(foodData: FoodData(name: "test", cal: 0, carbs: 0, fat: 0, protein: 0)), breakfast: $lunch)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                        }//NavigationLink
                                        .background(Color(.black))
                                        .cornerRadius(15)
                                        .padding()
                                        
                                    }//HStack
                                    .font(.system(size: 12))
                                    
                                    Spacer()
                                    
                                        VStack {
                                            ForEach(lunch) { food in
                                                HStack {
                                                    VStack {
                                                        Text(food.name )
                                                    }//VStack
                                                    .frame(alignment: .leading)
                                                    Spacer()
                                                        .frame(width: 30)
                                                    VStack {
                                                        Text(String(food.cal) )
                                                    }//VStack
                                                    .frame(alignment: .leading)
                                                    
                                                }//HStack
                                            }
                                            
                                        }//VStack
                                        .scaledToFit()
                                        .padding(.bottom)
                                        .frame(alignment: .leading)                                    
                                    
                                    
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
                                        
                                        NavigationLink(destination:FoodView(viewModel: FoodDataViewModel(foodData: FoodData(name: "test", cal: 0, carbs: 0, fat: 0, protein: 0)), breakfast: $dinner)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                        }//NavigationLink
                                        .background(Color(.black))
                                        .cornerRadius(15)
                                        .padding()
                                        
                                    }//HStack
                                    .font(.system(size: 12))
                                    
                                    Spacer()
                                    
                                    VStack {
                                        ForEach(dinner) { food in
                                            HStack {
                                                VStack {
                                                    Text(food.name )
                                                }//VStack
                                                .frame(alignment: .leading)
                                                Spacer()
                                                    .frame(width: 30)
                                                VStack {
                                                    Text(String(food.cal) )
                                                }//VStack
                                                .frame(alignment: .leading)
                                                
                                            }//HStack
                                        }
                                        
                                    }//VStack
                                    .scaledToFit()
                                    .padding(.bottom)
                                    .frame(alignment: .leading)
                                    
                                    
                                    
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
                                        
                                        NavigationLink(destination:ExerciseView(viewModel: ExerciseDataViewModel(), exercise: $exercise)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                        }//NavigationLink
                                        .background(Color(.black))
                                        .cornerRadius(15)
                                        .padding()
                                        
                                    }//HStack
                                    .font(.system(size: 12))
                                    
                                    Spacer()
                                    
                                    VStack {
                                        ForEach(exercise) { exercise in
                                            HStack {
                                                VStack {
                                                    Text(exercise.exerciseName )
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
                                        
                                    }//VStack
                                    .scaledToFit()
                                    .padding(.bottom)
                                    .frame(alignment: .leading)
                                    
                                }//VStack
                                
                                
                            }//HStack
                            .frame(width: 350, height: 100, alignment: .center)
                            .background(Color(.black))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            
                            Button(action: {
                                logViewModel.storeLogData(userId: user?.uid ?? "" , breakfast: breakfast, dinner: dinner, lunch: lunch, exercise: exercise, sleep: sleep, weight: weight)
                                
                            }) {
                                Text("Store Log")
                                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 50)
                                
                            }
                            .background(Color.black)
                            .foregroundColor(Color.white)
                            .cornerRadius(40)
                              
                        }//VStack
                        
                }//ScroolView
                
                
            }//VStack
           
            
        }//ZStack
        .edgesIgnoringSafeArea(.all)
        .onAppear {
            viewModel.getUserInputData()
        }
        
    }//some View
    
}//View

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(viewModel: UserDataViewModel(data: UserData(id: "0", firstName: "test", lastName: "test", gender: "test", height: "test", weight: "test", age: "test", weightTarget: "test")), logViewModel: LogViewModel())
    }
}







