//
//  HomePage.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 29/11/2020.
//

import SwiftUI
import FirebaseAuth

struct HomePage: View {
    let user = Auth.auth().currentUser

    @EnvironmentObject var session: Session
    
    func getUserInputData(documentId: String) {
        session.getUserInputData(documentId: user!.uid)
    }

     
    var body: some View {
        VStack {
            Button(action: {
                getUserInputData(documentId: user!.uid)
            }) {
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
            }//Button
        }
    }
}

struct HomePage_Previews: PreviewProvider {
    static var previews: some View {
        HomePage()
    }
}
