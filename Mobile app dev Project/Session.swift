//
//  Session.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 21/11/2020.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import Firestore


class Session: ObservableObject {
    @Published var session: User?
    
    func logIn(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().signIn(withEmail: email, password: password, completion: handler)
    }
    
    func signUp(email: String, password: String, handler: @escaping AuthDataResultCallback) {
        Auth.auth().createUser(withEmail: email, password: password, completion: handler)
    }
    
    
    
    func storeData(firstName: String, lastName: String, age: String,gender: String, heigth: String, weight: String, weightTarget: String, documentId: String) {
        
        Firestore.firestore()
            .collection("User_Data")
            .document(documentId)
            .setData([
                "age": age,
                "gender": gender,
                "height": heigth,
                "weight": weight,
                "weightTarget": weightTarget,
                "lastName": lastName,
                "firstName": firstName
            ]) { err in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                    print("Document successfully written!")
                }
            }
    }
    
}
