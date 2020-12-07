//
//  WelcomePageView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 22/11/2020.
//

import SwiftUI

struct WelcomePageView: View {
    
    @EnvironmentObject var session: Session
    let verticalPaddingForForm = 40.0
    
    
    
    var body: some View {
        
        
        NavigationView {
            ZStack {
                RadialGradient(gradient: Gradient(colors: [.blue, .red]), center: .center, startRadius: 100, endRadius: 470)
                
                VStack {
                    
                    Image("fitness icon")
                    
                    Text("Welcome to")
                        .font(Font.largeTitle.weight(.heavy))
                        .foregroundColor(Color(.white))
                        .padding(.bottom)
                    Text("MyFitnessApp")
                        .font(Font.largeTitle.weight(.heavy))
                        .foregroundColor(Color(.white))
                    
                    
                    Spacer()
                        .frame(height: 80)
                    
                    HStack{
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Log in")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(40)
                        }
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign up")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(40)
                        }
                        
                    }//HStack
                    
                    
                }//VStack
                .padding(.horizontal, CGFloat(verticalPaddingForForm))

                
            }//ZStack
            .edgesIgnoringSafeArea(.all)

            
            
        }//NavigationView
        
    }//some View
}//View

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
