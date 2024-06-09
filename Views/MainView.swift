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
            
            if true /*viewModel.is_signed_in, !viewModel.current_user_id.isEmpty*/ {
                // User is signed in
//                Text(viewModel.current_user_id)
                
                TabView{
                    ConcertsView(user_id: viewModel.current_user_id)
                        .tabItem {
                            Label("My Concerts", systemImage: "music.note")
                        }
                    ProfileView()
                        .tabItem {
                            Label("Profile", systemImage: "person.circle")
                        }
                
                }
                
            }
            else {
                
//                LoginView()
            }
            
        }
    }


#Preview {
    MainView()
}
