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
                    
                    Image("fitness icons")
                        .resizable()
                        .frame(width: 180, height: 180, alignment: .center)
                        .padding(.bottom, 50)
                        .padding(.leading, 15)
                        .shadow(radius: 10)
                    
                    Text("Welcome to")
                        .frame(alignment: .center)
                        .font(Font.largeTitle.weight(.heavy))
                        .foregroundColor(Color(.white))
                        .padding(.bottom)
                        .shadow(radius: 10)
                    Text(" MyFitnessApp")
                        .font(Font.largeTitle.weight(.heavy))
                        .foregroundColor(Color(.white))
                        .frame(alignment: .center)
                        .shadow(radius: 10)
                    
                    
                    Spacer()
                        .frame(height: 80)
                    
                    VStack{
                        
                        NavigationLink(destination: LoginView()) {
                            Text("Log in")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(40)
                                .shadow(radius: 10)
                        }
                        
                        NavigationLink(destination: SignUpView()) {
                            Text("Sign up")
                                .padding()
                                .foregroundColor(.white)
                                .background(Color.black)
                                .cornerRadius(40)
                                .shadow(radius: 10)
                        }
                        
                    }//VStack
                    
                    
                }//VStack
                .padding(.horizontal, CGFloat(verticalPaddingForForm))
                .frame(alignment: .center)

                
            }//ZStack
            .edgesIgnoringSafeArea(.all)
            .frame(alignment: .center)

            
            
        }//NavigationView
        .accentColor( .black)

        
    }//some View
}//View

struct WelcomePageView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomePageView()
    }
}
