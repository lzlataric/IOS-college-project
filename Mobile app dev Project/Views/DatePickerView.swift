//
//  DatePickerView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 13.12.2020..
//

import SwiftUI

struct DatePickerView: View {
    @State private var choosenDate = Date()
    
    var dateFormatter : DateFormatter  {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            
            VStack {
                
                Text("Select the Date")
                    .font(Font.title.weight(.heavy))
                    .foregroundColor(Color(.white))
                    .padding(.bottom)
                    .shadow(radius: 10)
                
                DatePicker(selection: $choosenDate, in: ...Date(), displayedComponents: .date) {
                }
                .frame(width: 100, height: 100, alignment: .center)
                .font(Font.title.weight(.heavy))
                .padding()
                
                Text("Date is \(choosenDate, formatter: dateFormatter)")
                    .font(Font.title2.weight(.heavy))
                    .foregroundColor(Color(.white))
                    .padding(.bottom)
                    .shadow(radius: 10)
                
                NavigationLink(destination:DateSearchView(viewModel: UserDataViewModel(data: UserData(id: "", firstName: "", lastName: "", gender: "", height: "", weight: "", age: "", weightTarget: "")), logViewModel: LogViewModel(), choosenDate: $choosenDate)) {
                    EmptyView()
                    Text("Choose")
                        .foregroundColor(.white)
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 50)
                }//NavigationLink
                .background(Color(.black))
                .cornerRadius(15)
                .padding()
                .shadow(radius: 10)
            }//VStack
            //.frame(width: 300, height: 300, alignment: .center)
//            .background(Color.white)
//            .opacity(0.8)
//            .shadow(radius: 10)
            
        }//ZStack
        .edgesIgnoringSafeArea(.all)
        
    }//Some View
}//View

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
