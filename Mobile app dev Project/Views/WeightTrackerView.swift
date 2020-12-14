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
    var body: some View {
        ZStack {
            //Graf
            //Izracunavanje BF
            
            LineView(data:logViewModel.weightData, title: "Weight Tracking")
            
            //Text(String(logViewModel.weightData[0]))
            //Text("22")

        }
        .onAppear{
            logViewModel.getAllWeightLogs()
        }
        
    }
    
}

//struct WeightTrackerView_Previews: PreviewProvider {
//    static var previews: some View {
//        WeightTrackerView()
//    }
//}
