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
    @State var search: String = ""
    
    func getData(search: String) -> [FoodData] {
            
            let filtered = foods.data.filter { (obj: FoodData) in
                obj.name.contains(search.lowercased())
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
                                }
                        }
                    } else {
                        List(getData(search: search)) { data in
                                VStack(alignment: .leading) {
                                    // 3.
                                    Text(data.name)
                                }
                            
                            
                        }
                    }
                    
                    
                }
    }
}

