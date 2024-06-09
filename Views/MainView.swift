//
//  ContentView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI



struct MainView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
    
            // If user is not signed in, display the login screen
            
            if viewModel.is_signed_in, !viewModel.current_user_id.isEmpty {
                
                Text(viewModel.current_user_id)
                // User is signed in
                ConcertsView()
//                LoginView()
                
            }
            else {
                LoginView()
            }
            
        }
    }


#Preview {
    MainView()
}
