//
//  SignUpView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 22/11/2020.
//

import SwiftUI
import Firebase
import FirebaseAuth
import FirebaseDatabase

struct SignUpView: View {
    @State var email: String = ""
    @State var password: String = ""
    @State var name: String = ""
    @State var lastname: String = ""
    @State private var shouldNavigate = false
    let verticalPaddingForForm = 40.0

    
    @EnvironmentObject var session: Session
    
    func signUp() {
        if !email.isEmpty && !password.isEmpty {
            session.signUp(email: email, password: password) { (result, error) in
                if error != nil {
                    print("Error sign up")
                } else {
                    self.session.logIn(email: email, password: password) { (result, error) in
                        if error != nil {
                            print("Error login")
                        } else {
                            let user = Auth.auth().currentUser

                            print(user?.email, user?.uid)

                            self.shouldNavigate = true

                        }
                    }
                }
            }
        }
    }
    
    
    var body: some View {
        
       // NavigationView {
        
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
            VStack {
                Text("Sign In")
                    .font(Font.largeTitle.weight(.heavy))
                
                HStack {
                    Image(systemName: "person")
                        .foregroundColor(.secondary)
                    TextField("Email", text: $email)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                
                HStack {
                    Image(systemName: "key")
                        .foregroundColor(.secondary)
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .foregroundColor(Color.black)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(10)
                
                
                    Button(action: signUp) {
                        HStack {
                            Image(systemName: "arrow")
                                .font(.title)
                            Text("Next")
                                .fontWeight(.semibold)
                                .font(.title)
                        }
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                    }
                
                
                NavigationLink(destination: UserDataInputView(), isActive: $shouldNavigate) {
                    EmptyView()
                }
                
                
            }//VStack
            .padding(.horizontal, CGFloat(verticalPaddingForForm))

            
        }//ZStack
            
        //}//navigationView
        
    }//some View
    
}//View

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
