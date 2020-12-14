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
    
    //Chart UI Style
    let chartStyle = ChartStyle(backgroundColor: Color.black, accentColor: Colors.OrangeStart, secondGradientColor: Colors.OrangeEnd, textColor: Color.white, legendTextColor: Color.white, dropShadowColor: .black )
    
    
    @State var bodyFatCalculation : Double = 0
    
    func calculateBodyFat(height: String, neck: String, waist: String) {
        let finalheight: Double = Double(height) ?? 0
        let finalneck: Double = Double(neck) ?? 0
        let finalwaist : Double = Double(waist) ?? 0
        bodyFatCalculation = 86.010*log10(finalwaist - finalneck) - 70.041 * log10(finalheight) + 36.76 - 6
    }
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            
            VStack {
                
                VStack {
                    
                    LineView(data:logViewModel.weightData, title: "Weight Tracking", style: chartStyle)
                        .frame(width: 300, height: 300, alignment: .center)
                        .padding()
                    
                }//VStack
                
                VStack{
                    
                    Text("Calculate Body Fat")
                        .font(Font.title2.weight(.heavy))
                        .foregroundColor(Color(.white))
                        .padding(.bottom, 10)
                        .shadow(radius: 10)
                    
                    TextField("Height in cm", text: $height)
                        .keyboardType(.numberPad)
                        .frame(width: 150, height: 40, alignment: .center)
                        .autocapitalization(.none)
                        .background(Color.white)
                        .opacity(0.8)
                        .shadow(radius: 10)
                        .cornerRadius(13)
                        .multilineTextAlignment(.center)
                    
                    TextField("Neck in cm",text: $neck)
                        .keyboardType(.numberPad)
                        .frame(width: 150, height: 40, alignment: .center)
                        .autocapitalization(.none)
                        .background(Color.white)
                        .opacity(0.8)
                        .shadow(radius: 10)
                        .cornerRadius(13)
                        .multilineTextAlignment(.center)
                    
                    TextField("Waist in cm",text: $waist)
                        .keyboardType(.numberPad)
                        .frame(width: 150, height: 40, alignment: .center)
                        .autocapitalization(.none)
                        .background(Color.white)
                        .opacity(0.8)
                        .shadow(radius: 10)
                        .cornerRadius(13)
                        .padding(.bottom)
                        .multilineTextAlignment(.center)
                    
                    Button(action: {
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
                        .font(Font.title3.weight(.heavy))
                        .foregroundColor(Color(.white))
                        .padding(.bottom)
                        .shadow(radius: 10)
                }//VStack
                
                Spacer()
                    .frame(height: 70)
                
            }//VStack
            
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
