//
//  FoodView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 07.12.2020..
//

import SwiftUI

struct FoodView: View {
    @ObservedObject var foods = FoodDataViewModel(foodData: FoodData(name: "test", cal: 0, carbs: 0, fat: 0, protein: 0))
    @ObservedObject var viewModel : FoodDataViewModel
    
    @Binding var breakfast: [FoodData]
    
    @State var name = ""
    @State var cal : Double = 0
    @State var carbs : Double = 0
    @State var fat : Double = 0
    @State var protein : Double = 0
    @State var shouldNavigate = false
    
    
    @State var search: String = ""
    
    
    func getData(search: String) -> [FoodData] {
        
        let filtered = foods.data.filter { (obj: FoodData) in
            obj.name.lowercased().contains(search)
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
                
                Image("food")
                    .resizable()
                    .frame(width: 100, height: 100, alignment: .center)
                    .shadow(radius: 10)
                
                TextField("Enter a exercise", text: $search)
                    .frame(width: 300, height: 40, alignment: .center)
                    .autocapitalization(.none)
                    .background(Color.white)
                    .opacity(0.8)
                    .shadow(radius: 10)
                    .cornerRadius(13)
                    .padding()
                
                
                
                    if (search == "") {
                        List(foods.data) { data in
                            VStack(alignment: .leading) {
                                Text(data.name)
                                    .onTapGesture {
                                        self.name = data.name
                                        self.cal = data.cal
                                        self.carbs = data.carbs
                                        self.fat = data.fat
                                        self.protein = data.protein
                                        self.shouldNavigate = true
                                    }
                            }//VStack
                        }//List
                        .frame(width: 300, height: 400)
                        .opacity(0.8)
                        .shadow(radius: 10)
                        .cornerRadius(13)
                        
                        NavigationLink(destination: FoodDetailView(name: $name, cal: $cal, carbs: $carbs, fat: $fat, protein: $protein, foodlist: $breakfast),  isActive: $shouldNavigate) {
                            EmptyView()
                        }
                    } else {
                        List(getData(search: search)) { data in
                            VStack(alignment: .leading) {
                                Text(data.name)
                                    .onTapGesture {
                                        
                                        self.name = data.name
                                        self.cal = data.cal
                                        self.carbs = data.carbs
                                        self.fat = data.fat
                                        self.protein = data.protein
                                        self.shouldNavigate = true
                                        print(breakfast)
                                    }
                            }//VStack
                        }//List
                        .frame(width: 300, height: 400)
                        .opacity(0.8)
                        .shadow(radius: 10)
                        .cornerRadius(13)
                        
                        NavigationLink(destination: FoodDetailView(name: $name, cal: $cal, carbs: $carbs, fat: $fat, protein: $protein, foodlist: $breakfast),  isActive: $shouldNavigate) {
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

