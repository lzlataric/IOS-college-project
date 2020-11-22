//
//  Mobile_app_dev_ProjectApp.swift
//  Mobile app dev Project
//
//  Created by Dominik Bosnjak on 19/11/2020.
//

import SwiftUI
import Firebase

@main
struct Mobile_app_dev_ProjectApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}


class AppDelegate: NSObject, UIApplicationDelegate {

    func application(_ application: UIApplication,
      didFinishLaunchingWithOptions launchOptions:
          [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
      FirebaseApp.configure()
      return true
    }

}
