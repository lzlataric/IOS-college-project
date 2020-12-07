//
//  ContentView.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 19/11/2020.
//

import SwiftUI




struct ContentView: View {
    @ObservedObject var session = Session()

    
    var body: some View {
        VStack {
            
            WelcomePageView().environmentObject(session)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
