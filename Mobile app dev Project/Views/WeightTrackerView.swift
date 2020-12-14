//
//  WeightTrackerView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 13.12.2020..
//

import SwiftUI
import SwiftUICharts

struct WeightTrackerView: View {
    @ObservedObject var logViewModel : LogViewModel
    
    @State var height : String = ""
    @State var neck : String = ""
    @State var waist : String = ""
    
   
    
    @State var bodyFatCalculation : Double = 0
    
    func calculateBodyFat(height: String, neck: String, waist: String) {
        let finalheight: Double = Double(height) ?? 0
        let finalneck: Double = Double(neck) ?? 0
        let finalwaist : Double = Double(waist) ?? 0
        //let first log : Double
        bodyFatCalculation = 86.010*log10(finalwaist - finalneck) - 70.041 * log10(finalheight) + 36.76 - 6
        print(finalheight)
        print(bodyFatCalculation)
    }

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)

            LineView(data:logViewModel.weightData, title: "Weight Tracking")
            
            Spacer().frame(height: 1200)
            
            VStack{
            Text("Calculate Body Fat")
                .font(Font.title2.weight(.heavy))
                .foregroundColor(Color(.white))
                .padding(.bottom)
                .shadow(radius: 10)
            
                TextField("Height in cm", text: $height)
                .keyboardType(.numberPad)
                .frame(width: 150, height: 40, alignment: .center)
                .autocapitalization(.none)
                .background(Color.white)
                .opacity(0.8)
                .shadow(radius: 10)
                .cornerRadius(13)
            
            TextField("Neck in cm",text: $neck)
                .keyboardType(.numberPad)
                .frame(width: 150, height: 40, alignment: .center)
                .autocapitalization(.none)
                .background(Color.white)
                .opacity(0.8)
                .shadow(radius: 10)
                .cornerRadius(13)
            
            TextField("Waist in cm",text: $waist)
                .keyboardType(.numberPad)
                .frame(width: 150, height: 40, alignment: .center)
                .autocapitalization(.none)
                .background(Color.white)
                .opacity(0.8)
                .shadow(radius: 10)
                .cornerRadius(13)
                .padding(.bottom)
            
            Button(action: {
                //sleepAmount = Double(quantity) ?? 0
                calculateBodyFat(height: height, neck: neck, waist: waist)
                
            }) {
                Text("Calculate")
                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 50)
            }
            .background(Color.black)
            .foregroundColor(Color.white)
            .cornerRadius(40)
            .shadow(radius: 10)
            .padding(.bottom)
            
            Text("Body fat percentage")
                .font(Font.title2.weight(.heavy))
                .foregroundColor(Color(.white))
                .padding(.bottom)
                .shadow(radius: 10)
            
                Text(String(round(1000*bodyFatCalculation)/1000))
                .font(Font.title2.weight(.heavy))
                .foregroundColor(Color(.white))
                .padding(.bottom)
                .shadow(radius: 10)
            }
        }//ZStack
        .edgesIgnoringSafeArea(.all)
        .onAppear{
            logViewModel.getAllWeightLogs()
        }
        
    }//Some View
    
}//View

//struct WeightTrackerView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeightTrackerView()
//    }
//}
