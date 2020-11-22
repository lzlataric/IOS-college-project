//
//  Test.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import SwiftUI
import UIKit
import Firebase
import FirebaseAuth
import FirebaseDatabase


struct Test: View {
    
    //MARK: Properties
    @State var email: String = ""
    @State var password: String = ""
    let user = Auth.auth().currentUser

    
    
    @EnvironmentObject var session: Session
    
    func logIn() {
            session.logIn(email: email, password: password) { (result, error) in
                if error != nil {
                    print("Error")
                } else {
                    print(user?.email)
                    
                }
            }
        }
        
    var body: some View {
        VStack(spacing: 20) {
            Text("Sign In")
            TextField("Email", text: $email)
            
            SecureField("Password", text: $password)
            Button(action: logIn) {
                Text("Sign In")
            }
            .padding()
        }
    .padding()
    }
    
    

    
    //MARK: Functions
    
}

struct Test_Previews: PreviewProvider {
    static var previews: some View {
        Test()
    }
}



