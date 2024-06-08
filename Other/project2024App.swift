//
//  project2024App.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI
import FirebaseCore

// App entry point

@main
struct project2024App: App {
    
    // Use info from the GoogleService Firebase config file
    init(){
        FirebaseApp.configure()
    }
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
    }
}
