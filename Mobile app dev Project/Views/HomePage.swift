//
//  HomePage.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 29/11/2020.
//

import SwiftUI
import FirebaseAuth

struct HomePage: View {
    let currentUser = Auth.auth().currentUser
        
    @ObservedObject var viewModel : UserDataViewModel

    
    func printanje(){
        print(viewModel.data.firstName)
    }

     
    var body: some View {
        VStack {
            
            Text(viewModel.data.firstName)
                                
            
            NavigationLink(destination:FoodView(viewModel: FoodDataViewModel(foodData: FoodData(name: "test", cal: 0, carbs: 0, fat: 0, protein: 0)))) {
                EmptyView()
                Text("Pick food")
            }
            
        }//VStack
        .onAppear{
            viewModel.getUserInputData()
        }
    }//some Viwe
}//View

//struct HomePage_Previews: PreviewProvider {
//    static var previews: some View {
//        HomePage(user: UserData)
//    }
//}
