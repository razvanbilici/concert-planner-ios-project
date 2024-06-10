//
//  project2024App.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI
import FirebaseCore
import Firebase
import FirebaseAppCheck

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}


// App entry point

@main
struct project2024App: App {
    
    // Use info from the GoogleService Firebase config file

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
