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
        
        ZStack{
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            
            VStack {
                
                Text("Enter the quantity")
                    .font(Font.title2.weight(.heavy))
                    .foregroundColor(Color(.white))
                    .padding(.bottom)
                    .shadow(radius: 10)
                
                TextField("Amount x 100g portion",text: $quantity)
                    .keyboardType(.numberPad)
                    .frame(width: 300, height: 40, alignment: .center)
                    .autocapitalization(.none)
                    .background(Color.white)
                    .opacity(0.8)
                    .shadow(radius: 10)
                    .cornerRadius(13)
                    .padding()
                
                Button(action: {
                    calculateQuantity(quantity: quantity)
                }) {
                    Text("Add")
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 50)
                }
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                .shadow(radius: 10)
                
            }//VStack
            .cornerRadius(15)
            .shadow(radius: 10)
            
            
        }//ZStack
        .edgesIgnoringSafeArea(.all)
        
    }//some View
}//View

//struct FoodDetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        FoodDetailView()
//    }
//}
