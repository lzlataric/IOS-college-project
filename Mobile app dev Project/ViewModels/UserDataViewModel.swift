//
//  UserDataViewModel.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 01/12/2020.
//

import Foundation
import Firebase
import FirebaseAuth
import FirebaseDatabase
import FirebaseFirestore

final class UserDataViewModel: ObservableObject {
    @Published private(set) var data: UserData

    init(data: UserData) {
//        let currentUser = Auth.auth().currentUser
        self.data = data
//        getUserInputData(documentId: currentUser?.uid ?? "")
    }
    
    func getUserInputData() {
       guard let currentUser = Auth.auth().currentUser
       else {
        return
       }

        
        Firestore.firestore()
            .collection("User_Data")
            .document(currentUser.uid)
            .getDocument { (arg,err)  in
                if let err = err {
                    print("Error writing document: \(err)")
                } else {
                   
                    if let arg = arg {
                        DispatchQueue.main.async {
                            let response = arg.data()
                            self.data.firstName = response?["firstName"] as? String ?? ""
                            self.data.lastName = response?["lastName"] as? String ?? ""
                            self.data.age = response?["age"] as? String ?? ""
                            self.data.gender = response?["gender"] as? String ?? ""
                            self.data.height = response?["height"] as? String ?? ""
                            self.data.weight = response?["weight"] as? String ?? ""
                            self.data.weightTarget = response?["weightTarget"] as? String ?? ""
                        }
                    }
                    
                }
            }//getDocument
    }//func getUserInputData
    
}//class

