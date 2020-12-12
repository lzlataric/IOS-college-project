//
//  UserDataInputView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 24/11/2020.
//

import SwiftUI
import FirebaseAuth

struct UserDataInputView: View {
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var age: String = ""
    @State var gender: String = ""
    @State var height: String = ""
    @State var weight: String = ""
    @State var weightTarget: String = ""
    @State private var shouldNavigate = false
    let verticalPaddingForForm = 40.0
    
    
    @EnvironmentObject var session: Session
    
    func storeData() {
        guard let user = Auth.auth().currentUser else { fatalError("user not found") }
        print(user.uid)
        session.storeData(firstName: firstName, lastName: lastName, age: age, gender: gender, heigth: height, weight: weight, weightTarget: weightTarget, documentId: user.uid);
        shouldNavigate = true
    }
    
    
    
    var body: some View {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            
            VStack {
                
                Text("Sign In")
                    .font(Font.largeTitle.weight(.heavy))
                    .foregroundColor(Color(.white))
                    .padding(.bottom)
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("First name", text: $firstName)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("Last name", text: $lastName)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                HStack {
                    Image(systemName: "age")
                        .foregroundColor(.secondary)
                    TextField("Age", text: $age)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                HStack {
                    Image(systemName: "gender")
                        .foregroundColor(.secondary)
                    TextField("Gender", text: $gender)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                HStack {
                    Image(systemName: "measure")
                        .foregroundColor(.secondary)
                    TextField("Height", text: $height)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                HStack {
                    Image(systemName: "measure")
                        .foregroundColor(.secondary)
                    TextField("Weight", text: $weight)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                
                HStack {
                    Image(systemName: "measure")
                        .foregroundColor(.secondary)
                    TextField("Target weight", text: $weightTarget)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .padding(.bottom)
                
                Button(action: storeData) {
                    Text("Sign up")
                        .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 50)
                    
                }
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                
                NavigationLink(destination: HomePage(viewModel: UserDataViewModel(data: UserData(id: "test", firstName: "test", lastName: "test", gender: "test", height: "test", weight: "test", age: "test", weightTarget: "test")), logViewModel: LogViewModel()), isActive: $shouldNavigate) {
                    EmptyView()
                }
                .navigationBarTitle("")
                .navigationBarHidden(true)
                .navigationBarBackButtonHidden(true)

                
            }//VStack
            .padding(.horizontal, CGFloat(verticalPaddingForForm))
            
        }//ZStack
        .edgesIgnoringSafeArea(.all)
        
        
    }//Some View
}///View


//struct UserDataInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserDataInputView()
//    }
//}
