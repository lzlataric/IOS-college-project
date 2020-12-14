//
//  WaterView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 14.12.2020..
//

import SwiftUI

struct WaterView: View {
    @Binding var waterAmount : Double
    
    @State var quantity = ""
   
    @Environment(\.presentationMode) private var presentationMode : Binding<PresentationMode>

    
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
        VStack {

        Text("Enter the quantity")
            .font(Font.title2.weight(.heavy))
            .foregroundColor(Color(.white))
            .padding(.bottom)
            .shadow(radius: 10)
        
        TextField("Water in l",text: $quantity)
            .keyboardType(.numberPad)
            .frame(width: 300, height: 40, alignment: .center)
            .autocapitalization(.none)
            .background(Color.white)
            .opacity(0.8)
            .shadow(radius: 10)
            .cornerRadius(13)
            .padding()
            .multilineTextAlignment(.center)
        
        
        Button(action: {
            waterAmount = Double(quantity) ?? 0
            self.presentationMode.wrappedValue.dismiss()

            
        }) {
            Text("Add")
                .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 50)
        }
        .background(Color.black)
        .foregroundColor(Color.white)
        .cornerRadius(40)
        .shadow(radius: 10)
        
            
        }//VStack
        
        }//ZStack
        .edgesIgnoringSafeArea(.all)
        
    }//Some View
}//View

//struct WeightView_Previews: PreviewProvider {
//    static var previews: some View {
//        WaterView()
//    }
//}
