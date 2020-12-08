//
//  HomePage.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 29/11/2020.
//

import SwiftUI
import FirebaseAuth

struct HomePage: View {
    let currentUser = Auth.auth().currentUser
        
    @ObservedObject var viewModel : UserDataViewModel
    @ObservedObject var logViewModel = LogViewModel()
    let verticalPaddingForForm = 40.0
    var currentDate = "Fri, 9 Oct"
    @State private var shouldNavigate = true

     
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            VStack(spacing: CGFloat(verticalPaddingForForm)) {
                HStack {
                    
                    Text("<")
                        .padding(.leading)
                    Text(currentDate)
                        .padding()
                    Text(">")
                    Spacer()
                        .scaledToFit()
                    Text(viewModel.data.firstName)
                    Image(systemName: "person.fill")
                        .padding()
                }//HStack
                .frame(width: 380, height: 60, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .background(Color(.black))
                .edgesIgnoringSafeArea(.all)
                .foregroundColor(.white)

                            
//                Spacer()
//                    .frame(height: 20)
                
                VStack(spacing: CGFloat(verticalPaddingForForm)) {
                    
                    HStack {
                        Image("graph")
                            .resizable()
                            .frame(width: 150.0, height: 150.0)
                            //.scaledToFit()
                        
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
                    .frame(width: 350, height: 170, alignment: .center)
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
                        VStack {
                            Text("Breakfast")
                                .padding()
                            Text("Eggs")
                        }.font(.system(size: 12))
                        Spacer()
                        VStack {
                            Button(action: {
                                
                            }) {
                                Text("+")
                                    .font(.system(size: 20))
                            }//Button
                            
                            NavigationLink(destination:FoodView(viewModel: FoodDataViewModel(foodData: FoodData(name: "test", cal: 0, carbs: 0, fat: 0, protein: 0)))) {
                                EmptyView()
                                Text("+")
                                    .foregroundColor(.white)
                                    .padding()
                            }//NavigationLink
                            .background(Color(.black))
                            .cornerRadius(15)
                            
                            Text("350 cal")
                                .padding()
                            
                            
                        }
                        
                    }//HStack
                    .frame(width: 350, height: 100, alignment: .center)
                    .background(Color(.black))
                    .cornerRadius(15)
                    .foregroundColor(.white)

                    
                        
                        
                        
                   }//VStack
                    .onAppear{
                        viewModel.getUserInputData()
                    }
                    .padding(.horizontal, CGFloat(verticalPaddingForForm))
                            
                Button(action: {
                    
                }) {
                    Text("+")
                        .font(.system(size: 20))
                }//Button
                
                NavigationLink(destination:ExerciseView(viewModel: ExerciseDataViewModel())) {
                    EmptyView()
                    Text("ALO E")
                        .foregroundColor(.white)
                        .padding()
                }//NavigationLink
                .background(Color(.black))
                .cornerRadius(15)
                
                List(logViewModel.data) { data in
                        VStack(alignment: .leading) {
                            // 3.
                            Text(data.userId)
                        }}
                
            }//VStack
           

        }//ZStack
        .edgesIgnoringSafeArea(.all)

        
     
    }//some Viwe
}//View

struct ListHeader: View {
    var body: some View {
        HStack {
            Image(systemName: "map")
            Text("Hiking Trails in Silicon Valley")
        }
        Spacer()
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage(viewModel: UserDataViewModel(data: UserData(id: "0", firstName: "test", lastName: "test", gender: "test", height: "test", weight: "test", age: "test", weightTarget: "test")))
    }
}
