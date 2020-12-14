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
        VStack {
            DatePicker(selection: $choosenDate, in: ...Date(), displayedComponents: .date) {
                Text("select Date")
            }
            
            Text("Date is \(choosenDate, formatter: dateFormatter)")
            
            NavigationLink(destination:DateSearchView(viewModel: UserDataViewModel(data: UserData(id: "", firstName: "", lastName: "", gender: "", height: "", weight: "", age: "", weightTarget: "")), logViewModel: LogViewModel(), choosenDate: $choosenDate)) {
                EmptyView()
                Text("+")
                    .foregroundColor(.white)
            }//NavigationLink
            .background(Color(.black))
            .cornerRadius(15)
            .padding()
        }
    }
}

struct DatePickerView_Previews: PreviewProvider {
    static var previews: some View {
        DatePickerView()
    }
}
