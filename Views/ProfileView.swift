//
//  ProfileView.swift
//  project2024
//
//  Created by user264991 on 6/8/24.
//

import SwiftUI

struct ProfileView: View {
    
    @StateObject var viewModel = ProfileViewModel()
    
    var body: some View {
        
            NavigationView{
                VStack{
                    
                    if let user = viewModel.user{
                        
                        let vi = viewModel
                        
                        Image(systemName: "person")
                        
                        Text("Username")
                        Text(user.username)
                        
                        Text("Email")
                        Text(user.email)
                        
                        Text("Total Number Of Concerts")
                        Text("\(viewModel.number_of_concerts)")
                        
                    }
                }
                .navigationTitle("Profile")
            }
            .onAppear{
                viewModel.get_user()
            }
        }
    
}

#Preview {
    ProfileView()
}
