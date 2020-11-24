//
//  WelcomePageView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 22/11/2020.
//

import SwiftUI

struct WelcomePageView: View {
    @ObservedObject var session = Session()
    
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination: LoginView().environmentObject(session)) {
                    Text("Log in")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                    
                }
                
                NavigationLink(destination: SignUpView().environmentObject(session)) {
                    Text("Sign up")
                        .padding()
                        .foregroundColor(.white)
                        .background(Color.red)
                        .cornerRadius(40)
                    
                }
                
            }
        }
        
    }
}

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
