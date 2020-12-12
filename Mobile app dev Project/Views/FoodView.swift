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
            obj.name.contains(search)
        }
        return filtered
    }
    
    var body: some View {
        TextField("Enter a word", text: $search)
        //.autocapitalizationType
        //.onChange(of: Equatable, perform: <#T##(Equatable) -> Void#>)
        
        Button(action: {
            getData(search: search)
        }) {
            Text("Submit")
        }
        
        VStack {
            if (search == "") {
                List(foods.data) { data in
                    VStack(alignment: .leading) {
                        // 3.
                        Text(data.name)
                            .onTapGesture {
                                self.name = data.name
                                self.cal = data.cal
                                self.carbs = data.carbs
                                self.fat = data.fat
                                self.protein = data.protein
                                self.shouldNavigate = true
                                print(self.name)
                            }
                    }
                }
                NavigationLink(destination: FoodDetailView(name: $name, cal: $cal, carbs: $carbs, fat: $fat, protein: $protein, foodlist: $breakfast),  isActive: $shouldNavigate) {
                    EmptyView()
                }
            } else {
                List(getData(search: search)) { data in
                    VStack(alignment: .leading) {
                        // 3.
                        Text(data.name)
                            .onLongPressGesture {
                                breakfast.append(data)
                                print(breakfast)
                                }
                    }
                    
                    
                }
            }
            
            
        }//VStack
    }//some View
}//View

