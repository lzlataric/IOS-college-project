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
    //let user = Auth.auth().currentUser
    @State private var shouldNavigate = false
    
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
            
            VStack {
                
                TextField(
                    "Email address",
                    text: $email
                )
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
                
                SecureField(
                    "Password",
                    text: $password
                )
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .border(Color(UIColor.separator))
                
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
            
       // }//navigationView
        
    }//some View
    
}//View

//struct SignUpView_Previews: PreviewProvider {
//    static var previews: some View {
//        SignUpView()
//    }
//}
