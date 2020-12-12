//
//  FoodDetailView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 12.12.2020..
//

import SwiftUI

struct FoodDetailView: View {
    
    @Binding var name : String
    @Binding var cal : Double
    @Binding var carbs : Double
    @Binding var fat : Double
    @Binding var protein : Double
    
    @Binding var foodlist : [FoodData]
    
    @State var quantity = ""
    
    func calculateQuantity(quantity: String) {
        //let finalName = name
        let finalCalories = cal * Double(quantity)!
        let finalFat = fat * Double(quantity)!
        let finalCarbs = carbs * Double(quantity)!
        let finalProtein = protein * Double(quantity)!
        let foodListFinal = FoodData(name: name, cal: finalCalories, carbs: finalCarbs, fat: finalFat, protein: finalProtein)
        foodlist.append(foodListFinal)
    }
    
    var body: some View {
        TextField("Enter food quantity",text: $quantity)
            .keyboardType(.numberPad)
        
        Button(action: {
            calculateQuantity(quantity: quantity)
        }) {
            Text("add food")
        }
    }
}

//struct FoodDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodDetailView()
//    }
//}
