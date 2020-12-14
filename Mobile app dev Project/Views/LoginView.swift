//
//  LoginView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 22/11/2020.
//

import SwiftUI
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


struct LoginView: View {
        
    //MARK: Properties
    @State var email: String = "dominik.bosnjak94@gmail.com"
    @State var password: String = "test1234"
    @State private var shouldNavigate = false
    let verticalPaddingForForm = 40.0
    
    @ObservedObject private var logViewModel = LogViewModel()
    
    @EnvironmentObject var session: Session
    
    @State var isLoggedIn = false

    
    func logIn() {
        session.logIn(email: email, password: password) { (result, error) in
            if error != nil {
                print("Error")
                isLoggedIn = true
            } else {
                isLoggedIn = false
                let user = Auth.auth().currentUser
                print(user?.uid)
                shouldNavigate = true
            }
        }
    }
    
    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            VStack(spacing: CGFloat(verticalPaddingForForm)) {
                
                Text("Log In")
                    .font(Font.largeTitle.weight(.heavy))
                    .foregroundColor(Color(.white))
                    .shadow(radius: 10)

                
                HStack {
                    Image(systemName: "person.fill")
                        .foregroundColor(.secondary)
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .opacity(0.8)
                .shadow(radius: 10)
                
                
                HStack {
                    Image(systemName: "key")
                        .foregroundColor(.secondary)
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                        .opacity(0.3)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                .opacity(0.8)
                .shadow(radius: 10)

                
                Button(action: logIn) {
                    Text("Login")
                    .frame(minWidth: 0, maxWidth: 100, minHeight: 0, maxHeight: 50)
                    

                }
                .background(Color.black)
                .foregroundColor(Color.white)
                .cornerRadius(40)
                .shadow(radius: 10)
                .alert(isPresented: $isLoggedIn) {
                    Alert (title: Text("Error"), message: Text("Wrong credentials, please provide the correct ones!"))
                }
                    

                
                NavigationLink(destination: HomePage(viewModel: UserDataViewModel(data: UserData(id: "test", firstName: "test", lastName: "test", gender: "test", height: "test", weight: "test", age: "test", weightTarget: "test")), logViewModel: logViewModel), isActive: $shouldNavigate) {
                    EmptyView()
                }
                

            }//VStack
            .padding(.horizontal, CGFloat(verticalPaddingForForm))

        }//ZStack
        .edgesIgnoringSafeArea(.all)
        
    }//some View
    //MARK: Functions
    
}//View

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        Group {
//            LoginView()
//        }
//    }
//}
