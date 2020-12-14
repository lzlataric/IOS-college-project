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
    @State var weight : Double = 0
    @State var water : Double = 0
    @State var userId : String = ""
    @State var currentDate = Date()
    @State var breakfast : [FoodData] = []
    @State var lunch : [FoodData] = []
    @State var dinner : [FoodData] = []
    @State var exerciseData : [ExerciseData] = []
    
    @State var breakfastCounter = -1
    @State var dinnerCounter = 0
    @State var lunchCounter = 0
    @State var exerciseCounter = 0
    
    let user = Auth.auth().currentUser
    
    @State var disableStoreButton = false
    
    @State private var shouldNavigate = true
    
    //General UI properties
    let verticalPaddingForForm = 40.0
    
    //Graph UI propreties
    let chartStyle = ChartStyle(backgroundColor: Color.black, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd, textColor: Color.white, legendTextColor: Color.white, dropShadowColor: .black )
    
    //Calculating daily calories
    @State private var caloriesLeft : Double = 0
    @State private var calorieIntake : Double = 0
    @State private var caloriesBurnedWithExercise : Double = 0
    @State private var goalCalories : Double = 2500
    
    func calorieCalculation() {
        
        for food in breakfast {
            self.calorieIntake = self.calorieIntake + food.cal
        }
        for food in lunch {
            self.calorieIntake = self.calorieIntake + food.cal
        }
        for food in dinner {
            self.calorieIntake = self.calorieIntake + food.cal
        }
        
        for exercise in exerciseData {
            self.caloriesBurnedWithExercise = self.caloriesBurnedWithExercise + Double(exercise.caloriesBurned)
        }
        
        self.caloriesLeft = self.goalCalories - self.calorieIntake + self.caloriesBurnedWithExercise
    }
    
    
    var body: some View {
        
        TabView {
            
            ZStack {
                
                RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
                
                VStack(spacing: CGFloat(verticalPaddingForForm)) {
                    
                    HStack {
                        
                        Text(Date(), style: .date)
                            .font(.headline)
                            .padding(.leading)
                        Spacer()
                            .scaledToFit()
                        Text(viewModel.data.firstName)
                            .font(.headline)
                        Image(systemName: "person.fill")
                            .padding()
                    }//HStack
                    .padding(.top, 40)
                    .frame(width: 380, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .cornerRadius(10)
                    .background(Color(.black))
                    .edgesIgnoringSafeArea(.all)
                    .foregroundColor(.white)
                    .zIndex(1)
                    .shadow(radius: 10)
                    
                    
                    ScrollView(showsIndicators: false) {
                        
                        
                        VStack(spacing: CGFloat(verticalPaddingForForm)) {
                            
                            
                            
                            HStack {
                                
                                PieChartView(data: [8,5,6], title: "Macro Nutrients ", style: chartStyle)
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
                                    Text(String(goalCalories))
                                        .padding(.top)
                                }
                                Text("+")
                                    .padding(.top, 35)
                                VStack {
                                    Text("Exercise")
                                        .font(.system(size: 12))
                                    Text(String(caloriesBurnedWithExercise))
                                        .padding(.top)
                                }
                                Text("-")
                                    .padding(.top, 35)
                                VStack {
                                    Text("Calories Eaten")
                                        .font(.system(size: 12))
                                    Text(String(calorieIntake))
                                        .padding(.top)
                                }
                                Text("=")
                                    .padding(.top, 35)
                                VStack {
                                    Text("Calories left")
                                        .font(.system(size: 12))
                                    if(caloriesLeft < 0) {
                                        Text(String(caloriesLeft))
                                            .foregroundColor(Color(.red))
                                            .padding(.top)
                                    } else {
                                        Text(String(caloriesLeft))
                                            .foregroundColor(Color(.green))
                                            .padding(.top)
                                    }
                                }
                                
                            }//HStack
                            .frame(width: 350, height: 100, alignment: .center)
                            .background(Color(.black))
                            .cornerRadius(15)
                            .foregroundColor(.white)
                            .shadow(radius: 10)
                            
                            
                            HStack{
                                
                                VStack{
                                    
                                    HStack {
                                        Text("Breakfast")
                                            .padding()
                                            .font(.headline)
                                        
                                        Spacer()
                                            .frame(width: 190)
                                        
                                        NavigationLink(destination:FoodView(viewModel: FoodDataViewModel(foodData: FoodData(name: "test", cal: 0.0, carbs: 0.0, fat: 0.0, protein: 0.0)), breakfast: $breakfast)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                                .font(.headline)
                                        }//NavigationLink
                                        .background(Color(.black))
                                        .padding()
                                        .navigationBarTitle("")
                                        .navigationBarHidden(true)
                                        .navigationBarBackButtonHidden(true)
                                        
                                    }//HStack
                                    .font(.system(size: 12))
                                    
                                    Spacer()
                                    
                                    VStack {
                                        ForEach(breakfast) { food in
                                            HStack {
                                                VStack {
                                                    Text(food.name )
                                                }//VStack
                                                .frame(width: 110, alignment: .leading)
                                                .padding(.leading, 5)
                                                
                                                Spacer()
                                                    .frame(width: 50)
                                                
                                                VStack {
                                                    Text(String(round(1000*food.cal)/1000))
                                                }//VStack
                                                .frame(width: 60, alignment: .trailing)
                                                
                                                
                                                Spacer()
                                                    .frame(width: 40)
                                                
                                                //VStack {
                                                    Image(systemName: "trash")
                                                        .onLongPressGesture {
                                                            if(breakfastCounter < breakfast.count){
                                                                breakfast.remove(at: breakfastCounter)
                                                            }
                                                            caloriesLeft = 0
                                                            calorieIntake = 0
                                                            caloriesBurnedWithExercise = 0
                                                            goalCalories = 2500
                                                            calorieCalculation()
                                                        }
                                                        .onAppear{
                                                            breakfastCounter += 1
                                                        }
                                                        .onDisappear{
                                                            breakfastCounter -= 1
                                                        }
//                                                }//VStack
//                                                .frame(width: 10, alignment: .trailing)
//                                                .padding(.trailing, 5)
                                                
                                                
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
                            .shadow(radius: 10)
                            
                            
                            HStack{
                                
                                VStack{
                                    
                                    HStack {
                                        Text("Lunch")
                                            .padding()
                                            .font(.headline)
                                        
                                        Spacer()
                                            .frame(width: 210)
                                        
                                        NavigationLink(destination:FoodView(viewModel: FoodDataViewModel(foodData: FoodData(name: "test", cal: 0, carbs: 0, fat: 0, protein: 0)), breakfast: $lunch)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                                .font(.headline)
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
                                                .frame(width: 110, alignment: .leading)
                                                .padding(.leading, 5)
                                                
                                                Spacer()
                                                    .frame(width: 50)
                                                
                                                VStack {
                                                    Text(String(round(1000*food.cal)/1000))
                                                }//VStack
                                                .frame(width: 60, alignment: .trailing)
                                                
                                                Spacer()
                                                    .frame(width: 40)
                                                
                                                VStack {
                                                    Image(systemName: "trash")
                                                        .onLongPressGesture {
                                                            if(lunchCounter < lunch.count){
                                                                lunch.remove(at: lunchCounter)
                                                            }
                                                            caloriesLeft = 0
                                                            calorieIntake = 0
                                                            caloriesBurnedWithExercise = 0
                                                            goalCalories = 2500
                                                            calorieCalculation()
                                                        }
                                                        .onAppear{
                                                            lunchCounter += 1
                                                        }
                                                        .onDisappear{
                                                            lunchCounter -= 1
                                                        }
                                                }//VStack
                                                .frame(width: 10, alignment: .trailing)
                                                .padding(.trailing, 5)
                                                
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
                            .shadow(radius: 10)
                            
                            
                            HStack{
                                
                                VStack{
                                    
                                    HStack {
                                        Text("Dinner")
                                            .padding()
                                            .font(.headline)
                                        
                                        Spacer()
                                            .frame(width: 210)
                                        
                                        NavigationLink(destination:FoodView(viewModel: FoodDataViewModel(foodData: FoodData(name: "test", cal: 0, carbs: 0, fat: 0, protein: 0)), breakfast: $dinner)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                                .font(.headline)
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
                                                .frame(width: 110, alignment: .leading)
                                                .padding(.leading, 5)
                                                
                                                Spacer()
                                                    .frame(width: 50)
                                                
                                                VStack {
                                                    Text(String(round(1000*food.cal)/1000))
                                                }//VStack
                                                .frame(width: 60, alignment: .trailing)
                                                
                                                
                                                Spacer()
                                                    .frame(width: 40)
                                                VStack {
                                                    Image(systemName: "trash")
                                                        .onLongPressGesture {
                                                            if(dinnerCounter < dinner.count){
                                                                dinner.remove(at: dinnerCounter)
                                                            }
                                                            caloriesLeft = 0
                                                            calorieIntake = 0
                                                            caloriesBurnedWithExercise = 0
                                                            goalCalories = 2500
                                                            calorieCalculation()
                                                        }
                                                        .onAppear{
                                                            dinnerCounter += 1
                                                        }
                                                        .onDisappear{
                                                            dinnerCounter -= 1
                                                        }
                                                }//VStack
                                                .frame(width: 10, alignment: .trailing)
                                                .padding(.trailing, 5)
                                                
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
                            .shadow(radius: 10)
                            
                            
                            HStack{
                                
                                VStack{
                                    
                                    HStack {
                                        Text("Exercise")
                                            .padding()
                                            .font(.headline)
                                        
                                        Spacer()
                                            .frame(width: 190)
                                        
                                        NavigationLink(destination:ExerciseView(viewModel: ExerciseDataViewModel(), exerciseList: $exerciseData)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                                .font(.headline)
                                        }//NavigationLink
                                        .background(Color(.black))
                                        .cornerRadius(15)
                                        .padding()
                                        
                                    }//HStack
                                    .font(.system(size: 12))
                                    
                                    Spacer()
                                    
                                    VStack {
                                        ForEach(exerciseData) { exercise in
                                            HStack {
                                                VStack {
                                                    Text(exercise.exerciseName)
                                                }//VStack
                                                .frame(width: 110, alignment: .leading)
                                                .padding(.leading, 5)
                                                
                                                Spacer()
                                                    .frame(width: 50)
                                                
                                                VStack {
                                                    Text(String(exercise.caloriesBurned))
                                                }//VStack
                                                .frame(width: 60, alignment: .trailing)
                                                
                                                
                                                Spacer()
                                                    .frame(width: 40)
                                                
                                                VStack {
                                                    Image(systemName: "trash")
                                                        .onLongPressGesture {
                                                            if(exerciseCounter < exerciseData.count){
                                                                exerciseData.remove(at: exerciseCounter)
                                                            }
                                                            caloriesLeft = 0
                                                            calorieIntake = 0
                                                            caloriesBurnedWithExercise = 0
                                                            goalCalories = 2500
                                                            calorieCalculation()
                                                        }
                                                        .onAppear{
                                                            exerciseCounter += 1
                                                        }
                                                        .onDisappear{
                                                            exerciseCounter -= 1
                                                        }
                                                }//VStack
                                                .frame(width: 10, alignment: .trailing)
                                                .padding(.trailing, 5)
                                                
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
                            .shadow(radius: 10)
                            
                            HStack{
                                
                                VStack{
                                    
                                    HStack {
                                        Text("Weight")
                                            .padding()
                                            .font(.headline)
                                        
                                        Spacer()
                                            .frame(width: 190)
                                        
                                        NavigationLink(destination: WeightView(weightAmount: $weight)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                                .font(.headline)
                                        }//NavigationLink
                                        .background(Color(.black))
                                        .cornerRadius(15)
                                        .padding()
                                        
                                    }//HStack
                                    .font(.system(size: 12))
                                    
                                    Spacer()
                                    
                                    VStack {
                                            HStack {
                                                VStack {
                                                    Text("Weight")
                                                }//VStack
                                                .frame(width: 110, alignment: .leading)
                                                .padding(.leading, 5)
                                                
                                                Spacer()
                                                    .frame(width: 50)
                                                
                                                VStack {
                                                    Text(String(weight))
                                                }//VStack
                                                .frame(width: 60, alignment: .trailing)
                                                
                                                
                                                Spacer()
                                                    .frame(width: 40)
                                                
                                                VStack {
                                                    Image(systemName: "trash")
                                                        .onLongPressGesture {
                                                            weight = 0
                                                        }
                                                }//VStack
                                                .frame(width: 10, alignment: .trailing)
                                                .padding(.trailing, 5)
                                                
                                            }//HStack
                                        
                                        
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
                            .shadow(radius: 10)
                            
                            
                            HStack{
                                
                                VStack{
                                    
                                    HStack {
                                        Text("Sleep")
                                            .padding()
                                            .font(.headline)
                                        
                                        Spacer()
                                            .frame(width: 190)
                                        
                                        NavigationLink(destination: SleepView(sleepAmount: $sleep)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                                .font(.headline)
                                        }//NavigationLink
                                        .background(Color(.black))
                                        .cornerRadius(15)
                                        .padding()
                                        
                                    }//HStack
                                    .font(.system(size: 12))
                                    
                                    Spacer()
                                    
                                    VStack {
                                            HStack {
                                                VStack {
                                                    Text("Sleep")
                                                }//VStack
                                                .frame(width: 110, alignment: .leading)
                                                .padding(.leading, 5)
                                                
                                                Spacer()
                                                    .frame(width: 50)
                                                
                                                VStack {
                                                    Text(String(sleep))
                                                }//VStack
                                                .frame(width: 60, alignment: .trailing)
                                                
                                                
                                                Spacer()
                                                    .frame(width: 40)
                                                
                                                VStack {
                                                    Image(systemName: "trash")
                                                        .onLongPressGesture {
                                                            sleep = 0
                                                        }
                                                }//VStack
                                                .frame(width: 10, alignment: .trailing)
                                                .padding(.trailing, 5)
                                                
                                            }//HStack
                                        
                                        
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
                            .shadow(radius: 10)
                            
                            HStack{
                                
                                VStack{
                                    
                                    HStack {
                                        Text("Water")
                                            .padding()
                                            .font(.headline)
                                        
                                        Spacer()
                                            .frame(width: 190)
                                        
                                        NavigationLink(destination: WaterView(waterAmount: $water)) {
                                            EmptyView()
                                            Text("+")
                                                .foregroundColor(.white)
                                                .font(.headline)
                                        }//NavigationLink
                                        .background(Color(.black))
                                        .cornerRadius(15)
                                        .padding()
                                        
                                    }//HStack
                                    .font(.system(size: 12))
                                    
                                    Spacer()
                                    
                                    VStack {
                                            HStack {
                                                VStack {
                                                    Text("Water")
                                                }//VStack
                                                .frame(width: 110, alignment: .leading)
                                                .padding(.leading, 5)
                                                
                                                Spacer()
                                                    .frame(width: 50)
                                                
                                                VStack {
                                                    Text(String(water))
                                                }//VStack
                                                .frame(width: 60, alignment: .trailing)
                                                
                                                
                                                Spacer()
                                                    .frame(width: 40)
                                                
                                                VStack {
                                                    Image(systemName: "trash")
                                                        .onLongPressGesture {
                                                            water = 0
                                                        }
                                                }//VStack
                                                .frame(width: 10, alignment: .trailing)
                                                .padding(.trailing, 5)
                                                
                                            }//HStack
                                        
                                        
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
                            .shadow(radius: 10)
                            
                            Group {
                            
                            Button(action: {
                                logViewModel.storeLogData(userId: user?.uid ?? "" , breakfast: breakfast, dinner: dinner, lunch: lunch, exercise: exerciseData, sleep: sleep, weight: weight, water: water)
                                self.disableStoreButton = true
                                
                            }) {
                                Text("Store Log")
                                    .frame(width: 100, height: 50)
                                
                            }
                            .background(Color.black)
                            .foregroundColor(Color.white)
                            .cornerRadius(40)
                            .disabled(self.disableStoreButton)
                            .shadow(radius: 10)
                            
                            Spacer()
                                .frame(height: 70)
                            }
                            
                        }//VStack
                        
                    }//ScroolView
                    
                }//VStack
                
                
            }//ZStack
            .edgesIgnoringSafeArea(.all)
            .onAppear {
                viewModel.getUserInputData()
                caloriesLeft = 0
                calorieIntake = 0
                caloriesBurnedWithExercise = 0
                goalCalories = 2500
                calorieCalculation()
            }
            .tabItem {
                Image("homePage")
                Text("Home")
            }
            
            
            DatePickerView()
                .tabItem {
                    Image("dateSearch")
                    Text("Search by Date")
                }
            
            
            WeightTrackerView(logViewModel: LogViewModel())
                .tabItem {
                    Image("weightTracker").resizable()
                    Text("Weight Tracker")
                }
            
            
        }//TabView
        .accentColor(.white)
        .onAppear() {
            UITabBar.appearance().barTintColor = .black
        }
        
        
    }//some View
    
}//View

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(viewModel: UserDataViewModel(data: UserData(id: "0", firstName: "test", lastName: "test", gender: "test", height: "test", weight: "test", age: "test", weightTarget: "test")), logViewModel: LogViewModel())
    }
}







