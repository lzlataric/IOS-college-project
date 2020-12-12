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
                            .onLongPressGesture {
                                breakfast.append(data)
                                print(breakfast)
                                }
                    }
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

