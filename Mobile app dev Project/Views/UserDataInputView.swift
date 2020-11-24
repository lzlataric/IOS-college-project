//
//  UserDataInputView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 24/11/2020.
//

import SwiftUI

struct UserDataInputView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var age: String = ""
    @State var gender: String = ""
    @State var height: String = ""
    @State var weight: String = ""
    @State var weightTarget: String = ""

    @ObservedObject var session = Session()

    
    
    var body: some View {
        
        VStack {
            
            TextField(
                "First Name",
                text: $firstName
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))
            
            TextField(
                "Last Name",
                text: $lastName
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))

            TextField(
                "Age",
                text: $age
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))

            TextField(
                "Gender",
                text: $gender
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))
            .padding(.bottom)

            TextField(
                "Height",
                text: $height
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))
            .padding(.bottom)

            TextField(
                "Weight",
                text: $weight
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))
            .padding(.bottom)

            TextField(
                "Targer Weight",
                text: $weightTarget
            )
            .autocapitalization(.none)
            .disableAutocorrection(true)
            .border(Color(UIColor.separator))
            .padding(.bottom)
            
//            Button(action: signUp) {
//                HStack {
//                    Image(systemName: "arrow")
//                        .font(.title)
//                    Text("Next")
//                        .fontWeight(.semibold)
//                        .font(.title)
//                }
//                .padding()
//                .foregroundColor(.white)
//                .background(Color.red)
//                .cornerRadius(40)
//            }
            
        
        
    }
}
}

struct UserDataInputView_Previews: PreviewProvider {
    static var previews: some View {
        UserDataInputView()
    }
}
