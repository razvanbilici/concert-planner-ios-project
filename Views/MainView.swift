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
                // User is signed in
//                Text(viewModel.current_user_id)
                
                TabView{
                    ConcertsView()
                        .tabItem {
                            Label("My Concerts", systemImage: "music.note")
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")
                        }
                
                }
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
